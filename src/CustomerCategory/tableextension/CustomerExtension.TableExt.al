tableextension 50100 CustomerExtension extends Customer
{

    fields
    {
        field(50100; "Bonuses"; Integer)
        {
            Caption = 'Bonuses';
            FieldClass = FlowField;
            CalcFormula = count(BonusHeader where("Customer No." = field("No.")));
            Editable = false;
        }
        field(50101; "CustomerCategory"; Code[20])
        {
            Caption = 'Customer Category No.';
            DataClassification = CustomerContent;
            TableRelation = "CustomerCategory".No;
        }


    }

    var
        BonusExistsErr: Label 'Nemužete smazat Customer %1 protože je přiřazen alespoň jeden Bonus', Comment = '%1 = Customer No.';  //%1 -> nahrazuje Customer No. jako {CustomerNo.}

    trigger OnBeforeDelete()
    var
        BonusHeader: Record BonusHeader;
    begin
        BonusHeader.SetRange("Customer No.", "No.");
        if not BonusHeader.IsEmpty() then
            Error(BonusExistsErr, "No.");
    end;

    procedure UpdateCreditLimit(NewCreditLimit: Decimal)
    begin

        NewCreditLimit := Round(NewCreditLimit, 10000);
        Rec.Validate("Credit Limit (LCY)", NewCreditLimit);
        Rec.Modify();
    end;


    procedure CalculateCreditLimit() ReturnValue: Decimal
    var
        Customer: Record Customer;
    begin
        Customer := Rec;
        Customer.SetRange("Date Filter", CalcDate('<-12M>', WorkDate()), WorkDate());
        Customer.CalcFields("Sales (LCY)", "Balance (LCY)");
        exit(Round(Customer."Sales (LCY)" * 0.5));
    end;

}