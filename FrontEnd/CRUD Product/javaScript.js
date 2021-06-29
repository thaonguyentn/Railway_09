// Khai báo danh sách các sản phẩm sử dụng trong chương trình
var dataDropdownlist = {
    "Dell": ["7710", "5510", "XPS"],
    "Apple": ["Iphone", "Ipad", "Macbook"],
    "Sam Sung": ["Galaxy Tab", "Note 10", "Galaxy Edge"]
}
// Đổ các sản phẩm phía trên vào Dropdown list Manufacturer
var Manufacturer_id = document.getElementById('Manufacturer_id')
var Manufacturer_Select_id = document.getElementById('Manufacturer_Select_id')
for(item in dataDropdownlist){
    Manufacturer_Select_id.innerHTML += `<option value="${item}">${item}</option>` 
}
// Hàm để đổ dữ liệu vào DropdownList Category_Name
function showListManufacturee() {
    var valueOfManufacture = Manufacturer_Select_id.value
    var Category_Name_Select_ID = document.getElementById('Category_Name_Select_ID')
    Category_Name_Select_ID.innerHTML ='<option value="">--Pls Select--</option>'
    if (valueOfManufacture != '') {
        var valueOfManufacture_list = dataDropdownlist[valueOfManufacture]
        for (var i = 0; i < valueOfManufacture_list.length; i++) {
            Category_Name_Select_ID.innerHTML += 
                `<option value="${valueOfManufacture_list[i]}">${valueOfManufacture_list[i]}</option>`             
        }
    }  
}
// Hàm tính giá trị cho hộp Total_Price
function updateTotalPrice() { 
    var v_priceByID = document.getElementById('Price_id').value
    var v_QuantityByID = document.getElementById('Quantity_id').value
    var v_Total_PriceByID     

    v_Total_PriceByID = (v_priceByID * v_QuantityByID)
    document.getElementById('Total_Price_id').value = v_Total_PriceByID
}
// Hàm khi nhấn nút Reset trên giao diện sẽ xóa hết các thông tin đang có trên Form để nhập lại từ đầu
function resetForm(){
    var v_product_Name_id = document.getElementById('Product_Name_id')
    var v_priceByID = document.getElementById('Price_id')
    var v_QuantityByID = document.getElementById('Quantity_id')
    var v_Total_PriceByID =document.getElementById('Total_Price_id')

    v_product_Name_id.value =''
    v_priceByID.value =''
    v_QuantityByID.value =''
    v_Total_PriceByID.value =''
}

var productList =[]
// Hàm để thêm mới sản phẩm vào giỏ hàng
function addProduct(){
   
    var v_product_Name_id = document.getElementById('Product_Name_id')
    var v_Manufacturer_Select_id = document.getElementById('Manufacturer_Select_id')
    var v_Category_Name_Select_ID = document.getElementById('Category_Name_Select_ID')
    var v_priceByID = document.getElementById('Price_id')
    var v_QuantityByID = document.getElementById('Quantity_id')
    var v_Total_PriceByID =document.getElementById('Total_Price_id')

    var product = {
        product_Name: v_product_Name_id.value,
        Manufacturer: v_Manufacturer_Select_id.value,
        Category_Name: v_Category_Name_Select_ID.value,
        price: v_priceByID.value,
        Quantity: v_QuantityByID.value,
        Total_Price: v_Total_PriceByID.value
    }
    productList.push(product)   
    showProduct()
    resetForm()
}
// Hàm hiển thị thông tin sản phẩm trong giỏ hàng
function showProduct() {
    var v_tb_product= document.getElementById('tb_product')
    v_tb_product.innerHTML =
       `<tr>
            <th>No</th>
            <th>Product Name</th>
            <th>Manufacturer Name</th>
            <th>Category Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Option</th>    
        </tr>`    
    for (var i= 0 ; i < productList.length; i++) {
        item = productList[i]
        v_tb_product.innerHTML += 
        `<tr>
            <td>${i+1}</td>
            <td>${item.product_Name}</td>
            <td>${item.Manufacturer}</td>
            <td>${item.Category_Name}</td>
            <td>${item.price}</td>
            <td>${item.Quantity}</td>
            <td>   
                <input type="button" value="Edit" class="btn btn-info" onclick="editProduct(${i})">
                <input type="button" value="Delete" class="btn btn-info" onclick="delProduct(${i})">
            </td>                   
        </tr>`        
    }   
}
// Hàm sửa thông tin sản phẩm trong giỏ hàng
function editProduct(index){
    document.getElementById('Product_Name_id').value = productList[index].product_Name
    document.getElementById('Manufacturer_Select_id').value = productList[index].Manufacturer
    document.getElementById('Category_Name_Select_ID').value = productList[index].Category_Name
    document.getElementById('Price_id').value = productList[index].price
    document.getElementById('Quantity_id').value = productList[index].Quantity
    document.getElementById('Total_Price_id').value = productList[index].Total_Price

    document.getElementById('btn_id').innerHTML =
        `<input type="button" class="btn btn-info" value="Add Product" onclick="addProduct()">
        <input type="button" class="btn btn-info" value="Reset" onclick="resetForm()">`
    document.getElementById('btn_id').innerHTML +=` 
        <input type="button" value="Save" class="btn btn-info" onclick="saveProduct(${index})">`
}
// Hàm thực hiện xử lý khi nhấn nút Save để lưu thay đổi sau khi sửa lại sản phẩm trong giỏ hàng
function saveProduct(index){
    var v_product_Name_id = document.getElementById('Product_Name_id')
    var v_Manufacturer_Select_id = document.getElementById('Manufacturer_Select_id')
    var v_Category_Name_Select_ID = document.getElementById('Category_Name_Select_ID')
    var v_priceByID = document.getElementById('Price_id')
    var v_QuantityByID = document.getElementById('Quantity_id')
    var v_Total_PriceByID =document.getElementById('Total_Price_id')

    productList[index].product_Name = v_product_Name_id.value
    productList[index].Manufacturer = v_Manufacturer_Select_id.value
    productList[index].Category_Name = v_Category_Name_Select_ID.value
    productList[index].price = v_priceByID.value
    productList[index].Quantity = v_QuantityByID.value
    productList[index].Total_Price = v_Total_PriceByID.value
    showProduct()
}
// Hàm xóa sản phẩm trong giỏ hàng
function delProduct(index){
    productList.splice(index,1)
    showProduct()
}

