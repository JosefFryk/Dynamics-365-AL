tableextension 50111 ItemLedgerEntryExtension extends "Item Ledger Entry"
{
    fields
    {

        field(50100; "CustomerCategory"; Code[20])
        {
            Caption = 'Customer Category';
            TableRelation = "CustomerCategory".No;
        }

    }




}