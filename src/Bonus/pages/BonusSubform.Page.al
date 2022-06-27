page 50103 "BonusSubform"
{
    Caption = 'Lines';
    PageType = ListPart;
    // ApplicationArea = All;
    // UsageCategory = Administration;
    SourceTable = BonusLine;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies type of the bonus assigned';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies item number for wich bonus is specifies';
                }
                field("Bonus Perc."; Rec."Bonus Perc.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus percent';
                }



            }
        }
    }
}