report 50110 CustomerCategoryList
{
    RDLCLayout = 'Layout\CustomerCategoryListRDLC.rdl';
    WordLayout = 'Layout\CustomerCategoryListWord.docx';
    Caption = 'Customer Category List';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(CustomerCategory; CustomerCategory)
        {
            column(No; No) { }
            column(Description; Description) { }
            column(TotalCustomerForCategory; TotalCustomerForCategory) { }
            column(FreeGiftsAvailable; FreeGiftsAvailable) { }

            trigger OnAfterGetRecord()
            var
            begin
                CalcFields(TotalCustomerForCategory);
            end;

        }
    }
}