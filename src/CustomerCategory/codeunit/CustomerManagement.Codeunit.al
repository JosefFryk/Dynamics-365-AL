codeunit 50110 "CustomerManagement"
{
    trigger OnRun();
    begin
    end;

    procedure AssignDefaultCategory(CustomerCode: Code[20])
    var
        Customer: Record Customer;
        CustomerCategory: Record CustomerCategory;

    begin
        Customer.Get(CustomerCode);
        CustomerCategory.SetRange(Default, true);
        if CustomerCategory.FindFirst() then begin
            Customer.CustomerCategory := CustomerCategory.No;
            Customer.Modify();
        end;
    end;

    procedure AssignDefaultCategory()
    var
        Customer: Record Customer;
        CustomerCategory: Record CustomerCategory;
    begin
        CustomerCategory.SetRange(Default, true);
        if CustomerCategory.FindFirst()
        then
            if Customer.FindSet() then;
        repeat
            Customer.CustomerCategory := CustomerCategory.No;
            Customer.Modify();
        until Customer.Next() = 0;

    end;

    procedure CreateDefaultCategory()
    var
        CustomerCategory: Record CustomerCategory;
    begin
        CustomerCategory.No := 'DEFAULT';
        CustomerCategory.Description := 'Default Customer Category';
        CustomerCategory.Default := true;
        if CustomerCategory.Insert() then;
    end;

    procedure GetTotalCustomerWithoutCategory(): Integer
    var
        Customer: Record Customer;

    begin
        Customer.SetRange(CustomerCategory, '');
        exit(Customer.Count());
    end;
}