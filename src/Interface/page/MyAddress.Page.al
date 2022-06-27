page 50120 MyAddress
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(WhatsTheAddress)
            {
                ApplicationArea = All;
                Caption = 'What is the Address?';
                ToolTip = 'Vyberte adresu.';
                Image = Addresses;

                trigger OnAction()
                var
                    iAddressProvider: Interface IAddressProvider;
                begin
                    AddressProviderFactory(iAddressProvider);
                    Message(iAddressProvider.GetAddress());
                end;
            }
            action(SendToHome)
            {
                ApplicationArea = All;
                Image = Home;
                Caption = 'Send to home';
                ToolTip = 'Nastavit upravy rozhani pro Domu';

                trigger OnAction()
                begin
                    sendTo := sendTo::Private
                end;
            }
            action(SendToWork)
            {
                ApplicationArea = All;
                Image = WorkCenter;
                Caption = 'Send to Work.';
                ToolTip = 'Nastavit upravy rozhrani pro Praci';


                trigger OnAction()
                begin
                    sendTo := sendTo::Company
                end;
            }
        }
    }
    local procedure AddressProviderFactory(var iAddressProvider: Interface IAddressProvider)
    var
        CompanyAddressProvider: Codeunit CompanyAddressProvider;
        PrivateAddressProvider: Codeunit PrivateAddressProvider;
    begin
        if sendTo = sendTo::Company then
            iAddressProvider := CompanyAddressProvider;
        if sendTo = sendTo::Private then
            iAddressProvider := PrivateAddressProvider;
    end;

    var
        sendTo: enum SendTo;

}