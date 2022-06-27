codeunit 50121 PrivateAddressProvider implements IAddressProvider
{
    procedure GetAddress(): Text;
    begin
        exit('My home address \ Teplice 41762')
    end;
}