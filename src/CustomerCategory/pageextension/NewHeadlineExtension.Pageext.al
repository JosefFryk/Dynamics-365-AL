// pageextension 50102 NewHeadlineExtension extends "Headline RC Business Manager"
// {
//     layout
//     {
//      addafter(Control2)
//      {
//         field(NewHeadlineText;Rec.NewHeadlineText)
//         {
//             ApplicationArea = All;
//             trigger OnDrillDown()
//             var
//                 Customer: Record Customer;
//                 CustomerList: Page"Customer List";
//             begin
//                 Customer.SetRange(CustomerCategory,'');
//                 CustomerList.SetTableView(Customer);
//                 CustomerList.Run();
//             end;

//         }

//      }   
//     }
//     var
//         NewHeadlineText: Text;
//         trigger OnOpenPage()
//     var
//         HeadlineMgt : Codeunit "HeadlineManagement";
//         CustomerManangement: Codeunit CustomerManagement;
//     begin
//         //nastavit headline text
//         NewHeadlineText := 'Number of Customers without assigned Category' + HeadlineMgt.Emphasize(Format(CustomerManangement.GetTotalCustomerWithoutCategory()));
//     end;
// }