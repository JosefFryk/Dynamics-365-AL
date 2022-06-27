pageextension 50110 CustomerCardExtension extends "Customer Card"
{

    layout
    {
        addlast(General)
        {
            field(CustomerCategory; Rec.CustomerCategory)
            {
                ApplicationArea = All;
                ToolTip = 'Customer Category';
            }
        }
    }

    actions
    {
        addlast("F&unctions")
        {
            action("Assign default category")
            {
                Image = ChangeCustomer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                Caption = 'Assign default category';
                ToolTip = 'Assign the default categort for the selected customer';

                trigger OnAction();
                var
                    CustomerManagement: Codeunit "CustomerManagement";
                begin
                    CustomerManagement.AssignDefaultCategory(Rec."No.");
                end;
            }
        }

        addAfter("F&unctions")
        {
            action(UpdateCreditLimit)
            {
                ApplicationArea = All;
                Caption = 'Update Credit Limit';
                Image = CalculateCost;
                ToolTip = 'Update';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    CallUpdateCreditLimit()
                end;
            }
        }
    }
    var
        AreYouSureQst: Label 'Are you sure that you want to set %1 to %2', Comment = '%1 = true or false ; %2 = value';
        CreditLimitRoundedTxt: Label 'The credit limit was rounded to %1 to comply with company policies.', Comment = '%1 = new limit';
        CreditLimitUpToDateTxt: Label 'The credit limit is up to date', Comment = 'Credit limit';


    local procedure CallUpdateCreditLimit()
    var
        CreditLimitCalculated: Decimal;
        CreditLimitActual: Decimal;
    begin
        CreditLimitCalculated := Rec.CalculateCreditLimit();
        if CreditLimitCalculated = Rec."Credit Limit (LCY)" then begin
            Message(CreditLimitUpToDateTxt);
            exit;
        end;

        if GuiAllowed() then
            if not Confirm(AreYouSureQst, false, Rec.FieldCaption("Credit Limit (LCY)"), CreditLimitCalculated) then
                exit;

        CreditLimitActual := CreditLimitCalculated;
        Rec.UpdateCreditLimit(CreditLimitActual);
        if CreditLimitActual <> CreditLimitCalculated then
            Message(CreditLimitRoundedTxt, CreditLimitActual);
    end;


}