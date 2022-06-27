codeunit 50105 CategoriesInstallCode

{
    Subtype = Install;

    trigger OnInstallAppPerCompany();
    var
        CustomerCategory: Record CustomerCategory;
    begin
        if CustomerCategory.IsEmpty() then
            InsertDefaultCategory();

    end;

    procedure InsertDefaultCategory();
    begin
        InsertCategoryLevel('GOLD', 'GOLD LEVEL', 20);
        InsertCategoryLevel('SILVER', 'SILVER LEVEL', 10);
        InsertCategoryLevel('BRONZE', 'BRONZE LEVEL', 5);

    end;

    procedure InsertCategoryLevel(ID: Code[20]; Description: Text[50]; Discount: Decimal);
    var
        CustomerCategory: Record CustomerCategory;
    begin
        CustomerCategory.Init();
        CustomerCategory.Description := Description;
        CustomerCategory.No := ID;
        CustomerCategory.Insert();
    end;
}