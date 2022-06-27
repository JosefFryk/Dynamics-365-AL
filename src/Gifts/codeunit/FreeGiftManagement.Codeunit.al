codeunit 50111 FreeGiftManagement
{
    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'Quantity', false, false)]

    local procedure AddFreeGift(var Rec: Record "Sales Line")
    var
        FreeGift: Record FreeGifts;
        SaleLine: Record "Sales Line";
        Customer: Record Customer;
    begin
        if (Rec.Type = Rec.Type::Item) and (Customer.Get(Rec."Sell-to Customer No.")) then begin
            if FreeGift.Get(Customer.CustomerCategory, Rec."No.") and (Rec.Quantity > FreeGift.MinimumOrderQuantity) then
                OnBeforeFreeGiftSalesLineAdded(Rec);
            SaleLine.init();
            SaleLine.TransferFields(Rec);
            SaleLine."Line No." := Rec."Line No." + 10000;
            SaleLine.Validate(Quantity, FreeGift.GiftQuantity);
            SaleLine.Validate("Line Discount %", 100);
            if SaleLine.Insert() then;
            OnAfterFreeGiftSalesLineAdded(Rec, SaleLine);

        end;
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeFreeGiftSalesLineAdded(var Rec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterFreeGiftSalesLineAdded(var Rec: Record "Sales Line"; var SalesLineGift: Record "Sales Line")
    begin
    end;

    [EventSubscriber(ObjectType::Table, 32, 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterItemLedgerEntryInsert(var Rec: Record "Item Ledger Entry")
    var
        Customer: Record Customer;

    begin
        if Rec."Entry Type" = Rec."Entry Type"::Sale then begin
            if Customer.Get(Rec."Source No.") then
                Rec.CustomerCategory := Customer.CustomerCategory;
            Rec.Modify();
        end;
    end;
}