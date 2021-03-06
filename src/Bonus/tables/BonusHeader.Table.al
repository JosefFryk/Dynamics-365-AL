table 50100 "BonusHeader"
{
    DataClassification = ToBeClassified;
    Caption = 'Bonus';
    DrillDownPageId = BonusList;
    LookupPageId = BonusList;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    BonusSetup.Get();
                    NoSeriesManagement.TestManual(BonusSetup."Bonus Nos.");
                    "No. Series" := '';

                end;
            end;

        }
        field(2; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(3; "Starting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Starting Date';

        }
        field(4; "Ending Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Ending Date';
        }
        field(5; "Status"; Enum "BonusStatus")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(6; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";

        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    var

        BonusSetup: Record "BonusSetup";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            BonusSetup.Get();
            BonusSetup.TestField("Bonus Nos.");
            NoSeriesManagement.InitSeries(BonusSetup."Bonus Nos.", xRec."No.", 0D, Rec."No.", Rec."No. Series");
        end;
    end;

    trigger OnModify()
    begin

    end;
}