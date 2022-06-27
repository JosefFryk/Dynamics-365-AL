page 50125 "Customer Overview List"
{
    Caption = 'Customer Overview List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CustomerOverview;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Entry Number';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer Number';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer`s Name';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Source Code';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Amount';
                }
                field(LastRunDate; Rec.LastRunDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Time Date';
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ImportRecords)
            {
                ApplicationArea = All;
                Caption = 'Import Records';
                Image = Import;
                ToolTip = 'Import Records';


                trigger OnAction()
                var
                    UpdateCustomerOverview: Codeunit CustomerOverviewMgmt;
                begin
                    UpdateCustomerOverview.Run();
                end;
            }
        }
    }

}
