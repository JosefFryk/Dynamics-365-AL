table 50113 "CustomerCategory"
{
    DrillDownPageId = "CustomerCategoryList";
    LookupPageId = "CustomerCategoryList";
    Caption = 'Customer Category';

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            trigger OnValidate();
            begin
            end;

        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; Default; Boolean)
        {
            Caption = 'Default';
            DataClassification = CustomerContent;
        }
        field(4; TotalCustomerForCategory; Integer) //je flowfield ktere scita cisla customers kteri jsou spojeni s kodem v tehle kategorii
        {
            Caption = 'Total customers for category';
            FieldClass = FlowField;
            CalcFormula = count(Customer where("CustomerCategory" = field(No)));
        }
        field(5; EnableNewsletter; Option)
        {
            OptionCaption = ' , Full, Limited';
            OptionMembers = " ","Full","Limited";
            DataClassification = CustomerContent;
            Caption = 'Enable Newsletter';
        }
        field(6; FreeGiftsAvailable; Boolean)
        {
            Caption = 'Free Gifts Available';
            DataClassification = CustomerContent;
        }


    }

    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }

}