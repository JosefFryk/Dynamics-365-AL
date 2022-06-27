page 50115 "FreeGiftList"
{
    Caption = 'Free Gift List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = FreeGifts;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(CustomerCategoryCode; Rec.CustomerCategoryCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer Category';
                }
                field(ItemNo; Rec.ItemNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Item number';
                }
                field(MinimumOrderQuantity; Rec.MinimumOrderQuantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Minimal Order';
                    Style = Strong;
                }
                field(GiftQuantity; Rec.GiftQuantity)
                {
                    ApplicationArea = All;
                    Style = Strong;
                    ToolTip = 'Quantity of Gift';
                }



            }
        }
    }

}