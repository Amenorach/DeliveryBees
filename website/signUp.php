<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/headers/">
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

    <!-- Custom styles for this template -->
    <link href="../css/signin.css" rel="stylesheet">
</head>
<body class="text-center" style="background-image: url('../images/blur.jpg');">
    <script src="../js/regis.js"></script>
    <main class="form-signin w-100 m-auto">
            <img class="mb-4" src="" alt="" width="150" height="57">
            <div class="text-muted">
                <h2>Sign Up</h2>
                <p>Please fill this form to create an account.</p>
            </div>
            <form action="addPerson.php" method="POST" name= "register" id= "register" onSubmit= "return formValidation()">
                <div class="form-floating">
                    <input type="text" name="customer_fname" id= "customer_fname" class="form-control">
                    <label>Your First Name</label>
                </div>    
                <div class="form-floating">
                    <input type="text" name="customer_lname" name= "customer_lname" class="form-control">
                    <label>Your Last Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" name="customer_contact" id="customer_contact" class="form-control">
                    <label>Contact Number</label>
                </div>
                <div class="form-floating">
                    <input type="text" name="customer_country" id="customer_country" class="form-control">
                    <label>Country</label>
                </div>
                <div class="form-floating">
                    <input type="text" name="customer_email" id= "customer_email" class="form-control">
                    <label>Email address</label>
                </div>
                <div class="form-floating">
                    <input type="password" name="customer_pass" id="customer_pass" class="form-control">
                    <label>Password</label>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" name="insertBtn" value="Submit">
                    <input type="reset" class="btn btn-secondary ml-2" value="Reset">
                </div>
                <div class="text-white">
                    <p>Already have an account? <a href="login.php">Login here</a>.</p>
                    <p class="mt-3 mb-3 text-muted">&copy; 2022</p>
                </div>
            </form> 
    </main>  
</body>
</html>