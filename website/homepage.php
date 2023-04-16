<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <style>
        /* .carousel-inner>.item>img,
        .carousel-inner>.item>a>img {
            width: 100%;
        } */

        .w-100 {
            width: 100% !important;
            height: 100vh;
        }
    </style>

</head>

<body>
    <div class="b-example-divider"></div>

    <!--Header of Page-->
    <header class="p-3 mb-2 bg-info text-white">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="index.php" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                    <img class="bi me-2" src="../images/DBlogo.png" width="150" height="120" role="img" aria-label="Bootstrap">
                    <use xlink:href="#bootstrap" />
                    </img>
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="../website/homepage.php" class="nav-link px-2 text-dark">Home</a></li>
                    <li><a href="../website/about.php" class="nav-link px-2 text-white">Tables</a></li>
                </ul>

                <div class="text-end">
                    <a href="../login/logout.php"><button type="button" class="btn btn-outline-light me-2">Logout</button></a>
                </div>
            </div>
        </div>
    </header>

    <main>
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../images/del.png" class="d-block w-100" alt="Light skin girl with brown hair">
                    <div class="carousel-caption d-none d-md-block text-dark">
                        <h4><strong>DELIVERY RIGHT AT YOUR DOORSTEP</strong></h4>
                        <p><strong>We Deliver Anything & Everything At Very Bugdget-Frendly Rates, Our Priority Is Your Comfort.</strong></p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="../images/kids.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h4><strong>WE INSPIRE LOVE</strong></h4>
                        <p><strong>We Do Our Best To Ensure No One Is Left Out In Trying Our Products.</strong></p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="../images/dark.PNG" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h4><strong>CONFIDENCE MADE EASY</strong></h4>
                        <p><strong>Our Products Boost The Confidence Levels In Our Loved Customers Due To Their Great Skin!</strong></p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">We Care About You. <span class="text-muted">And Your Skin Also.</span></h2>
                <p class="lead">In Our Hands, You Are Rest Assured That Your Skin Will Smile All The Time.<br> Stay Natural. Using More Chemicals On Your Hair And Skin Will Only Degrade Your Hairs & Skin In The Long Run. <br> <a href="shop.php"><strong>Shop With Us</strong></a> Now To Change That Future!</p>
            </div>
            <div class="col-md-5">
                <img src="../images/girls.jpg" alt="woman and child holding hands" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false">
                <title>Placeholder</title>
                <rect width="100%" height="100%" fill="#eee" /><text x="50%" y="50%" fill="#aaa" dy=".3em"></text></img>

            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading">Visit Us Today. <span class="text-muted">Check Out Our Mini-store & Warehourse.</span></h2>
                <p class="lead">Click <a href="http://v6.ashesi.edu.gh/about/contact-us.html">here</a>, and you'll be on the fastest route to finding us successfully.</p>
            </div>
            <div class="col-md-5">
                <img src="../images/pindrop.png" alt="Pin Drop" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false">
                <title>Location</title>
                <rect width="100%" height="100%" fill="#eee" /><text x="50%" y="50%" fill="#aaa" dy=".3em"></text></img>

            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">You See Products, <span class="text-muted">We See Makeovers.</span></h2>
                <p class="lead">We make and name every product with delight because we believe they take delight in making YOU over!<br> Shop, Try Them, Thank Us Later! <a href="shop.php">Click Here</a> to Shop!</p>
            </div>
            <div class="col-md-5">
                <img src="../images/lightskin.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false">
                <title>Placeholder</title>
                <rect width="100%" height="100%" fill="#eee" /><text x="50%" y="50%" fill="#aaa" dy=".3em"></text></img>

            </div>
        </div>

        <hr class="featurette-divider">

        <!-- /END THE FEATURETTES -->

        <div class="container py-4">

            <div class="p-5 mb-4 bg-light border rounded-3" style="background-image: url('../images/shaking.jpeg');">
                <div class="container-fluid py-5">
                    <h1 class="display-5 fw-bold">Shop With Us Today!</h1>
                    <p class="col-md-8 fs-4">Want to have an Unforgettable and Amazing Skin? <br> Shop With Us Today!</p>
                    <a href="shop.php"><button class="btn btn-success btn-lg" type="button">Go To Shop</button></a>
                </div>
            </div>

            <div class="row align-items-md-stretch">
                <div class="col-md-6">
                    <div class="h-100 p-5 text-white bg-dark rounded-3" style="background-image: url('focusedlion.jpg');">
                        <h2>Trying To Reach Us?!</h2>
                        <p>Look No Further! We Are Only A Click Away!</p>
                        <a href="contactUs.php"><button class="btn btn-outline-light" type="button">Contact Us</button></a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="h-100 p-5 bg-light border rounded-3" style="background-image: url('../images/blur.jpg');">
                        <h2>Want To Know More About Our Company?</h2>
                        <p>We Are More Than Happy To Tell You More About Ourselves! Click The Button Below To Find Out!</p>
                        <a href="about.php"><button class="btn btn-outline-secondary" type="button">About Us</button></a>
                    </div>
                </div>
            </div>
        </div>
    </main>


    <!--Footer of the page-->
    <footer>
        <div class="b-example-divider"></div>


        <div class="container">
            <footer class="py-5">
                <div class="row">
                    <div class="col-2">
                        <h4>Navigation</h4>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="../index.php" class="nav-link p-0 text-muted">Home</a></li>
                            <li class="nav-item mb-2"><a href="about.php" class="nav-link p-0 text-muted">About</a></li>
                            <li class="nav-item mb-2"><a href="shop.php" class="nav-link p-0 text-muted">Shop</a></li>
                            <li class="nav-item mb-2"><a href="contactUs.php" class="nav-link p-0 text-muted">Contact Us</a></li>
                        </ul>
                    </div>

                    <div class="col-2">
                        <h4>Contact Us</h4>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="mailto:neanama@gmail.com" class="nav-link p-0 text-muted">neanama@gmail.com</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Tel: (+233) 24 426 2700</a></li>
                            <li class="nav-item mb-2"><a href="http://v6.ashesi.edu.gh/about/contact-us.html" class="nav-link p-0 text-muted">Location: Dansoman, <br> Accra-Ghana</a></li>
                        </ul>
                    </div>

                    <div class="col-4 offset-4">
                        <form action="../actions/newsLet.php" method="POST">
                            <h4>Subscribe to our newsletter</h4>
                            <p>Monthly digest of whats new and exciting from us.</p>
                            <div class="d-flex w-90 gap-2">
                                <label for="news_email" class="visually-hidden">Email address</label>
                                <input id="news_email" type="text" name="news_email" class="form-control" placeholder="Email address">
                                <button class="btn btn-primary" name="email" type="submit">Subscribe</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="d-flex justify-content-between py-4 my-4 border-top">
                    <p>&copy; 2022 Company, Inc. All rights reserved.</p>
                    <ul class="list-unstyled d-flex">
                        <li class="ms-3"><a class="link-dark" href="https://twitter.com"><svg class="bi" width="24" height="24">
                                    <use xlink:href="#twitter" />
                                </svg></a></li>
                        <li class="ms-3"><a class="link-dark" href="https://instagram.com"><svg class="bi" width="24" height="24">
                                    <use xlink:href="#instagram" />
                                </svg></a></li>
                        <li class="ms-3"><a class="link-dark" href="https://facebook.com"><svg class="bi" width="24" height="24">
                                    <use xlink:href="#meta" />
                                </svg></a></li>
                    </ul>
                </div>
            </footer>
        </div>


        <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
    </footer>
</body>

</html>