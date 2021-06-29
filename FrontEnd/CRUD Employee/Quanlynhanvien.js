// Trong bài tập này sẽ xử dụng Jquery và JavaScript, JavaScript để thực hiện chức năng quản lý nhân viên, tương ứng với bảng Account trong DB TestingSystem, Các chức năng: Thêm, Sửa, Xóa. Dữ liệu này sẽ tương tác với server Backend API.
// Khai báo 1 array để lưu thông tin tất cả các Account trên hệ thống.
var listAccount = []
var listDepartment = []
var listPosition = []

// Khai bao cac bien su dung trong phan trang
var currentPage = 1;
var size = 5;
// Lưu thông tin tổng số trang
var totalPages;


$(function () {
    // Gọi hàm load dữ liệu từ Server API khi load trang
    getListEmployees();
    getlistDepartment();
    getlistPosition();


    $('#CretateDate_ID').attr('disabled', 'disabled')
    $('#ID').attr('disabled', 'disabled')


    // Hàm thực thi khi load đầy đủ các thành phần html
    $('#ResetButton').click(function () {
        // Xử lý sự kiện cho nút reset, Sử dụng JQuery để lấy các giá trị các trường theo ID, sau đó Set về rỗng
        $('#ID').val("")
        $('#EmailId').val("")
        $('#UsernameID').val("")
        $('#FullnameId').val("")
        $('#DepartmentId').val("")
        $('#PositionId').val("")
        $('#CretateDate_ID').val("")
    })

    // Xử lý sự kiện khi nhấn nút Save
    $('#CreateButton').submit(function () {
        // Xử lý sự kiện khi nhấn nút Submit của Form(Save), ở đây phải sử dụng Return False ở cuối sự kiện này để không redirect sang trang mới.
        // Lấy các giá trị người dùng nhập vào
        var v_ID_ID = $('#ID').val()
        var v_EmailId = $('#EmailId').val()
        var v_UsernameID = $('#UsernameID').val()
        var v_FullnameId = $('#FullnameId').val()
        var v_DepartmentId = $('#DepartmentId').val()
        var v_PositionId = $('#PositionId').val()
        // var v_CretateDate_ID = $('#CretateDate_ID').val()

        for (let index = 0; index < listDepartment.length; index++) {
            if (listDepartment[index].DepartmentName == v_DepartmentId) {
                var depID = listDepartment[index].DepartmentID
            }
        }
        // Lấy ra ID của Possition khi người dùng lựa chọn Possition
        for (let index = 0; index < listPosition.length; index++) {
            if (listPosition[index].PositionName == v_PositionId) {
                var posID = listPosition[index].PositionID
            }
        }

        // Sửa lại đối tượng Account chứa thông tin gửi đi sao cho các thuộc tính tương ứng với
        // AccountFormForCreating bên Backend. Comment lại trường 'CreateDate' do đã
        // được lấy tự động bằng thời gian hệ thống
        // Tạo 1 đối tượng account để lưu giữ thông tin nhận được
        var account = {
            'email': v_EmailId,
            'username': v_UsernameID,
            'fullname': v_FullnameId,
            'departmentId': depID,
            'positionId': posID,
            // 'createDate': v_CretateDate_ID
        }
        // Add account tới MOCK API
        $.ajax({
            url: 'http://localhost:8080/api/v1/accounts/',
            type: 'POST',
            data: JSON.stringify(account),
            contentType: "application/json",
            success: function (data, textStatus, xhr) {
                console.log(data);

                getListEmployees();
            },
            error(jqXHR, textStatus, errorThrown) {
                alert("error loading data");
                console.log(jqXHR);
                console.log(textStatus);
                console.log(errorThrown);

            }
        });
        return false;

        // Sử dụng return false để không redirect tới 1 trang khác.
    })
})
// Đoạn bên trên khi load hoàn chỉnh trang web sẽ kết thúc ở đây, đoạn dưới sẽ viết các hàm bổ trợ khác
// Viết hàm showAccount()
function showAccount() {
    // $('#EmailId').removeAttr("disabled")
    // $('#UsernameID').removeAttr("disabled")
    // Xóa hết kết quả đang hiển thị ở bảng kết quả

    $('#ResultAcount').empty()
    // Lặp trong listAccount để in thông tin từng phần tử
    // Hiển thị thêm 2 nút để sửa và xóa các Account
    for (var index = 0; index < listAccount.length; index++) {
        $('#ResultAcount').append(`
              <tr>
              <th>${listAccount[index].AccountID}</th>
              <th>${listAccount[index].Email}</th>
              <th>${listAccount[index].Username}</th>
              <th>${listAccount[index].FullName}</th>
              <th>${listAccount[index].Department}</th>
              <th>${listAccount[index].Position}</th>   
              <th>${listAccount[index].CreateDate}</th>
              <th><button class="btn btn-warning" onclick="editAccount(${index})">Edit</button></th>
              <th><button class="btn btn-warning" onclick="deleteAccount(${index})">Delete</button></th>
              </tr>
              `)
    }
}
// Viết hàm xóa account
function deleteAccount(Index) {
    var v_del_ID = listAccount[Index].AccountID;
    // Hiển thị 1 Confim Popup, chọn Có = True
    var confirm_del = confirm('Bạn có chắc chắn muốn xóa Account này không')
    if (confirm_del) {
        $.ajax({
            url: 'http://localhost:8080/api/v1/accounts/' + v_del_ID,
            type: 'DELETE',
            success: function (result) {
                // error
                if (result == undefined || result == null) {
                    alert("Error when loading data");
                    return;
                }
                // success
                resetPaging();
                getListEmployees();
            }
        });
    } else {
        return
    }
}
//// Viết hàm để Edit các account
// Click vao Edit de bay lai thong tin
function editAccount(index) {

    $('#EmailId').attr('disabled', 'disabled')
    $('#UsernameID').attr('disabled', 'disabled')
    $('#CretateDate_ID').attr('disabled', 'disabled')

    $('#ID').val(listAccount[index].AccountID)
    $('#EmailId').val(listAccount[index].Email)
    $('#UsernameID').val(listAccount[index].Username)
    $('#FullnameId').val(listAccount[index].FullName)
    $('#DepartmentId').val(listAccount[index].Department)
    $('#PositionId').val(listAccount[index].Position)
    $('#CretateDate_ID').val(listAccount[index].CreateDate)

    ////  Xử lý sự kiện khi click vào nút Update ( Sau khi Edit)
    $('#UpdateButton').click(function () {
        var v_ID = $('#ID').val()
        var v_FullnameId = $('#FullnameId').val()
        var v_DepartmentId = $('#DepartmentId').val()
        var v_PositionId = $('#PositionId').val()

        for (let index = 0; index < listDepartment.length; index++) {
            if (listDepartment[index].DepartmentName == v_DepartmentId) {
                var depID = listDepartment[index].DepartmentID
            }
        }
        for (let index = 0; index < listPosition.length; index++) {
            if (listPosition[index].PositionName == v_PositionId) {
                var posID = listPosition[index].PositionID
            }
        }

        // Ở đây chỉ cho người dùng update các trường, fullname, Department, Possition, các trường Username, Email trên thực tế sẽ để cố định.
        var account = {
            'id': v_ID,
            'fullname': v_FullnameId,
            'departmentId': depID,
            'positionId': posID,
        }
        $.ajax({
            url: 'http://localhost:8080/api/v1/accounts/' + v_ID,
            type: 'PUT',
            data: JSON.stringify(account),
            contentType: "application/json",
            success: function (data, textStatus, xhr) {
                console.log(data);

                getListEmployees();
            },
            error(jqXHR, textStatus, errorThrown) {
                alert("error loading data");
                console.log(jqXHR);
                console.log(textStatus);
                console.log(errorThrown);

            }
        });
    })
}
// Viết hàm gọi dữ liệu server API bằng Ajax khi load trang Web
function getListEmployees() {

    $.ajax({
        url: 'http://localhost:8080/api/v1/accounts/',
        type: 'GET',
        contentType: "application/json",
        dataType: 'json',
        success: function (data, textStatus, xhr) {
            listAccount = [];
            parseData(data);
            showAccount();
        },
        error(jqXHR, textStatus, errorThrown) {
            alert("error loading data");
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);

        }
    });
}
// hàm chuyển dữ liệu API nhận được bằng Ajax chuyển về dạng List để sử dụng trong chương trình
function parseData(data) {
    // employees = data;
    data.forEach(function (item) {
        var account = {
            'AccountID': item.id,
            'Email': item.email,
            'Username': item.username,
            'FullName': item.fullname,
            'Department': item.department,
            'Position': item.position,
            'CreateDate': item.createDate,
        }
        listAccount.push(account)
    });
}

// Call API Department
function getlistDepartment() {
    $.get("http://localhost:8080/api/v1/departments/",
        function (data, status) {
            listDepartment = [];
            if (status == "error") {
                alert('error loading data')
                return;
            }
            parseDataDep(data);
            showlistDep();

        },

    );
}

function parseDataDep(data) {
    data.forEach(function (item) {
        var department = {
            'DepartmentID': item.id,
            'DepartmentName': item.name,
        }
        listDepartment.push(department)
    });
};

function showlistDep() {
    var Department = document.getElementById('DepartmentId')
    $('#DepartmentId').empty();
    Department.innerHTML = '<option value="">--Pls Select Department--</option>'
    for (var index1 = 0; index1 < listDepartment.length; index1++) {
        $('#DepartmentId').append(
            `<option >${listDepartment[index1].DepartmentName}</option>`
        );
    }
}

// Call API Póition
function getlistPosition() {
    $.get("http://localhost:8080/api/v1/positions/",
        function (data, status) {
            listPosition = [];
            if (status == "error") {
                alert('error loading data')
                return;
            }
            parseDataPos(data);
            showlistPos();

        },

    );
}

function parseDataPos(data) {
    data.forEach(function (item) {
        var position = {
            'PositionID': item.id,
            'PositionName': item.name,
        }
        listPosition.push(position)
    });
};

function showlistPos() {
    var Position = document.getElementById('PositionId')
    $('#PositionId').empty();
    Position.innerHTML = '<option value="">--Pls Select Position--</option>'
    for (var index1 = 0; index1 < listPosition.length; index1++) {
        $('#PositionId').append(
            `<option >${listPosition[index1].PositionName}</option>`
        );
    }
}