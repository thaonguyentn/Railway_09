var listDepartment = []

$(function () {
    getlistDepartment();

    $('#ResetButton').click(function () {
        // Xử lý sự kiện cho nút reset, Sử dụng JQuery để lấy các giá trị các trường theo ID, sau đó Set về rỗng
        $('#ID_ID').val("")
        $('#Name_ID').val("")
    })

    $('#CreateButton').submit(function () {
        // Xử lý sự kiện khi nhấn nút Submit của Form(Save), ở đây phải sử dụng Return False ở cuối sự kiện này để không redirect sang trang mới.
        // Lấy các giá trị người dùng nhập vào
        var v_ID_ID = $('#ID_ID').val()
        var v_DepartmentName = $('#Name_ID').val()

        var Depart = {
            'DepartmentName': v_DepartmentName,
        }

        $.ajax({
            url: 'http://localhost:8080/api/v1/departments/',
            type: 'POST',
            data: JSON.stringify(Depart),
            contentType: "application/json",
            success: function (data, textStatus, xhr) {
                console.log(data);

                getlistDepartment();
            },
            error(jqXHR, textStatus, errorThrown) {
                alert("error loading data");
                console.log(jqXHR);
                console.log(textStatus);
                console.log(errorThrown);

            }
        });
        return false;
    })
})

function showDepartment() {
    $('#ResultDep').empty()
    for (var index = 0; index < listDepartment.length; index++) {
        $('#ResultDep').append(`
              <tr>
              <th>${listDepartment[index].DepartmentID}</th>
              <th>${listDepartment[index].DepartmentName}</th>
              <th><button class="btn btn-warning" onclick="editAccount(${index})">Edit</button></th>
              <th><button class="btn btn-warning" onclick="deleteAccount(${index})">Delete</button></th>
              </tr>
            `)
    }
}

function getlistDepartment() {
    $.ajax({
        url: 'http://localhost:8080/api/v1/departments/',
        type: 'GET',
        contentType: "application/json",
        dataType: 'json',
        success: function (data, textStatus, xhr) {
            listDepartment = [];
            parseData(data);
            showDepartment();
        },
        error(jqXHR, textStatus, errorThrown) {
            alert("error loading data");
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);

        }
    });
}

function parseData(data) {
    data.forEach(function (item) {
        var department = {
            'DepartmentID': item.id,
            'DepartmentName': item.name,
        }
        listDepartment.push(department)
    });
};



