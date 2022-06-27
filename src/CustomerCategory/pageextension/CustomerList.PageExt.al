pageextension 50101 CustomerList extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field(Bonuses; Rec.Bonuses)
            {
                ApplicationArea = All;
                ToolTip = 'Zobrazi cislo prirazenych bonusu pro Customer.';
            }

        }
    }

    actions
    {
        addlast(navigation)
        {
            action(AddBonuses)
            {
                ToolTip = 'Pridat Bonus';
                Caption = 'Bonuses';
                ApplicationArea = All;
                Image = Discount;
                RunObject = page "BonusList";
                RunPageLink = "Customer No." = field("No.");
            }
        }

        addlast(Processing)
        {
            action("Assign Default Category")
            {
                ApplicationArea = All;
                Image = ChangeCustomer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Caption = 'Assign Default Category to all Customers';
                ToolTip = 'Assign the Default Categort to all Customers';



                trigger OnAction()
                var
                    CustomerManagement: Codeunit "CustomerManagement";
                begin
                    CustomerManagement.AssignDefaultCategory();
                end;
            }
        }
    }
}