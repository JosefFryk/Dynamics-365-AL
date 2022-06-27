page 50114 "CustomerCategoryList"
{
    Caption = 'Customer Category List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = CustomerCategory;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Number of Category';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Description of Category';
                }
                field(Default; Rec.Default)
                {
                    ApplicationArea = All;
                    ToolTip = 'Default';
                }
                field(TotalCustomerForCategory; Rec.TotalCustomerForCategory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Total Customers for Category';
                }




            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action("Create Default Category")
            {
                ApplicationArea = All;
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Creates a default Customer Category';
                Caption = 'Create default category';

                trigger OnAction();
                var
                    CustomerManagement: Codeunit CustomerManagement;
                begin
                    OnBeforeCreateDefailtCategoryAction(Rec);
                    CustomerManagement.CreateDefaultCategory();
                    OnAfterCreateDefaultCategoryAction(Rec);
                end;
            }
        }
    }
    [IntegrationEvent(true, false)]
    local procedure OnBeforeCreateDefailtCategoryAction(var CustomerCategory: Record "CustomerCategory")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterCreateDefaultCategoryAction(var CustomerCategory: Record "CustomerCategory")
    begin
    end;
}