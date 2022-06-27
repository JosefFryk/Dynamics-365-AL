table 50125 CustomerOverview
{
    DataClassification = CustomerContent;
    Caption = 'Customer Overview';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
        }
        field(4; "Source Code"; Code[20])
        {
            Caption = 'Source Code';
            DataClassification = CustomerContent;
        }
        field(5; "Amount"; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(6; "LastRunDate"; DateTime)
        {
            Caption = 'Date Time';
            DataClassification = CustomerContent;
        }






    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

}