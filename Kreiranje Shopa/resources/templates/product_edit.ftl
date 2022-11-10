<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/css/style.css" />
</head>
<body>
    <div class="container">
        <header>
            <div>
                <h1 class="header">Edit Product</h1>
            </div>
        </header>
        <nav>
            <div class="nav" >
                <#list main_menu as item>
                    <li class="nav-item">
                        <a class="nav-link" href="${item.path}">${item.title}</a>
                    </li>
                </#list>
            </div>
        </nav>
        <div>

        <form action="/products/product/edit/${product.products_id}" method="post" enctype="multipart/form-data" class="form">
            <div class="mb-3 mt-3">
                <label class="form-label">Manufacturer</label>
                <input  type="checkbox" class="checkoption" name="manufacturer" id="lenovo" value="${product.manufacturer}" onclick="checkedOnClick(this);">LENOVO
                <input type="checkbox" class="checkoption" name="manufacturer" id="hp" value="${product.manufacturer}" onclick="checkedOnClick(this);">HP
                <input type="checkbox" class="checkoption" name="manufacturer" id="dell" value="${product.manufacturer}" onclick="checkedOnClick(this);">DELL
                <input type="checkbox" class="checkoption" name="manufacturer" id="acer" value="${product.manufacturer}" onclick="checkedOnClick(this);">ACER
            </div>
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" name="name" value="${product.name}">
            </div>
            <div class="mb-3">
                <label class="form-label">Price</label>
                <input type="number" name="price" value="${product.price}">
            </div>
            <div class="mb-3">
                <label class="form-label">Package</label>
                <input  type="checkbox" class="checkoption1" name="packages" id="standard" value="STANDARD" onclick="checkedOnClick1(this);">STANDARD
                <input type="checkbox" class="checkoption1" name="packages" id="premium" value="PREMIUM" onclick="checkedOnClick1(this);">PREMIUM
            </div>
            <div class="mb-3">
                <button class="modal-button" type="submit">Edit</button>
            </div>    
        </form>           
    </div>

    <script >
        function checkedOnClick(el){
           var checkboxesList = document.getElementsByClassName("checkoption");
           for (var i = 0; i < checkboxesList.length; i++) {
              checkboxesList.item(i).checked = false;
           }
           el.checked = true; 
        }
        function checkedOnClick1(el){
           var checkboxesList = document.getElementsByClassName("checkoption1");
           for (var i = 0; i < checkboxesList.length; i++) {
              checkboxesList.item(i).checked = false;
           }
           el.checked = true; 
        }
        </script>
</body>
</html>