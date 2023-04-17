<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard - Products</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/dashboard/">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>

    <script>
        $(document).ready(function() {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>

    <!-- Custom styles for this template -->
    <link href="../css/dashboard.css" rel="stylesheet">
</head>

<body>

    <header class="p-3 mb-2 bg-info text-white">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="index.php" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                    <img class="bi me-2" src="../images/DBlogo.png" width="150" height="120" role="img" aria-label="Bootstrap">
                    <use xlink:href="#bootstrap" />
                    </img>
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="../website/homepage.php" class="nav-link px-2 text-white">Home</a></li>
                    <li><a href="../website/about.php" class="nav-link px-2 text-dark">Tables</a></li>
                </ul>

                <div class="text-end">
                    <a href="../login/logout.php"><button type="button" class="btn btn-outline-light me-2">Logout</button></a>
                </div>
            </div>
        </div>
    </header>

    <div class="container-fluid">
        <div class="row">
            <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link " aria-current="page" href="./tables.php">
                                <span data-feather="home"></span>
                                Vehicle Identification
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./delInfo.php">
                                <span data-feather="file"></span>
                                Delivery Information
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./invoice.php">
                                <span data-feather="file"></span>
                                Invoice
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./inventory.php">
                                <span data-feather="users"></span>
                                Inventory
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="./senders.php">
                                <span data-feather="bar-chart-2"></span>
                                Senders
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./recipients.php">
                                <span data-feather="bar-chart-2"></span>
                                Receipients
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Sender Information</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
                            <span data-feather="calendar"></span>
                            This week
                        </button>
                    </div>
                </div>

                <div class="wrapper">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mt-5 mb-3 clearfix">
                                    <h3 class="pull-left">Details of Senders</h3>
                                </div>
                                <table class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Phone Number</th>
                                            <th>Email</th>
                                            <th>Street</th>
                                            <th>House Number</th>
                                            <th>City</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        require "../controller/all_controller.php";
                                        $result = sender();

                                        foreach ($result as $product) {
                                            echo "<tr>
                                                    <td>" . $product['cust_ID'] . "</td>
                                                    <td>" . $product['cust_fname'] . "</td>
                                                    <td>" . $product['cust_lname'] . "</td>
                                                    <td>" . $product['cust_phone'] . "</td>
                                                    <td>" . $product['cust_email'] . "</td>
                                                    <td>" . $product['street'] . "</td>
                                                    <td>" . $product['houseNumber'] . "</td>
                                                    <td>" . $product['city'] . "</td>";
                                                "</tr>";
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>


    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
    <script src="dashboard.js"></script>
</body>

</html>