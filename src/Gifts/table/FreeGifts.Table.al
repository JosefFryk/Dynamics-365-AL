table 50114 "FreeGifts"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "FreeGiftList";
    LookupPageId = "FreeGiftList";
    Caption = 'Free Gifts';


    fields
    {
        field(1; CustomerCategoryCode; Code[20])
        {
            Caption = 'Customer Category Code';
            DataClassification = CustomerContent;
            TableRelation = "CustomerCategory";
        }
        field(2; ItemNo; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item;
            Caption = 'Item No.';
        }
        field(3; MinimumOrderQuantity; Decimal)
        {
            Caption = 'Minimum Order Quantity';
            DataClassification = CustomerContent;
        }
        field(4; GiftQuantity; Decimal)
        {
            Caption = 'Free Gift Quantity';
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; "CustomerCategoryCode", ItemNo)
        {
            Clustered = true;
        }
    }

}