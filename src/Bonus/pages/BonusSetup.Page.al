page 50100 "BonusSetup"
{
    Caption = 'Bonus Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BonusSetup";
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Bonus Nos."; Rec."Bonus Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies number series that will be used for bonus number';
                }

            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();

        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

    end;
}