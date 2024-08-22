<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>ABC Restaurant - Index</title>
 

  <!-- Favicons -->

  
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <style>
        .service-container {
            display: flex;
            align-items: center;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            color: white;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .service-container img {
            width: 40%;
            height: auto;
            border-radius: 10px;
        }
        .service-details {
            padding-left: 20px;
            width: 60%;
        }
        .service-details h2,
        .service-details h3 {
            margin: 0;
        }
        .service-details h3 {
            color: #ffc107;
        }
        .service-details p {
            margin-top: 10px;
        }
    </style>
</head>
<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-cente">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">
    <c:choose>
        <c:when test="${sessionScope.customer != null}">
            <h1 class="logo me-auto me-lg-0"><a href="index">Welcome, ${sessionScope.customer.name}!</a></h1>
        </c:when>
        <c:otherwise>
            <h1 class="logo me-auto me-lg-0"><a href="index">ABC Restaurant</a></h1>
        </c:otherwise>
    </c:choose>

    <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
            <c:choose>
                <c:when test="${sessionScope.customer != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="index">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#menu">Menu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#specials">Offers</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#events">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#gallery">Gallery</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="customer?action=logout">Logout</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link" href="index">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#menu">Menu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#specials">Offers</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#events">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#gallery">Gallery</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="customer?action=login">Login</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <!-- Cart Icon with Number of Items -->
            <li class="nav-item">
                <a class="nav-link" href="cart.jsp">
                    <i class="bi bi-cart"></i> <!-- Bootstrap cart icon -->
                    <c:if test="${sessionScope.cart != null}">
                        <span class="badge bg-warning text-dark">
                            ${sessionScope.cart.items.size()}
                        </span>
                    </c:if>
                    <c:if test="${sessionScope.cart == null}">
                        <span class="badge bg-warning text-dark">0</span>
                    </c:if>
                </a>
            </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
    </nav><!-- .navbar -->

    <a href="#book-a-table" class="book-a-table-btn scrollto d-none d-lg-flex">Book a Table</a>
</div>

  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
      <div class="row">
        <div class="col-lg-8">
          <h1>Welcome to <span>ABC Restaurant</span></h1>
          <h2>Delivering great food for more than 18 years!</h2>

          <div class="btns">
            <a href="#menu" class="btn-menu animated fadeInUp scrollto">Our Menu</a>
            <a href="#book-a-table" class="btn-book animated fadeInUp scrollto">Book a Table</a>
          </div>
        </div>
      </div>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="row">
          <div class="col-lg-6 order-6 order-lg-6" data-aos="zoom-in" data-aos-delay="100">
            <div class="about-img">
              <img src="assets/img/about.jpg" alt="">
            </div>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
            <h3>About Us</h3>
            <p class="fst-italic" style="text-align: justify;">
              Welcome to ABC Restaurant, where culinary passion meets warm hospitality. Nestled in the heart of Kandy, we are dedicated to offering our guests an unforgettable dining experience that blends the rich flavors of global with the freshest local ingredients.
            </p>
            
            <h3>Our Story</h3>
            <p class="justify-text" >Founded in 2024, ABC was born from a passion for exploring the diverse culinary landscapes of the world. Our mission is to bring the best of Italian, Mediterranean, French, Mexican, Japanese, Indian, American, Thai, Fusion, and Farm-to-Table cuisines to your table, all crafted with the freshest ingredients and a deep love for food.</p>
            <h3>Our Values</h3>
            <ul>
              <li><i class="bi bi-check-circle" ></i> Diversity: Embracing the culinary traditions of cultures from around the globe.</li>
              <li><i class="bi bi-check-circle"></i> Quality: Using only the finest ingredients, sourced locally whenever possible, to ensure each dish is a true representation of its origins..</li>
              <li><i class="bi bi-check-circle"></i> Innovation: Combining traditional techniques with modern creativity to offer unique and unforgettable dining experiences..</li>
            </ul>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->

    <!-- ======= Why Us Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Why Us</h2>
          <p>Why Choose Our Restaurant</p>
        </div>

        <div class="row">

          <div class="col-lg-4">
            <div class="box" data-aos="zoom-in" data-aos-delay="100">
              <span>01</span>
              <h4>Online Ordering</h4>
              <p>Conveniently order your favorite dishes online and have them delivered straight to your door, hot and fresh</p>
            </div>
          </div>

          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="box" data-aos="zoom-in" data-aos-delay="200">
              <span>02</span>
              <h4>Quality Foods</h4>
              <p>Indulge in our carefully crafted dishes made with the finest ingredients to ensure a memorable dining experience</p>
            </div>
          </div>

          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="box" data-aos="zoom-in" data-aos-delay="300">
              <span>03</span>
              <h4>Private Dining</h4>
              <p>Enjoy an intimate dining experience in our exclusive special occasions or a quiet night out with loved ones</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Why Us Section -->

    <!-- ======= Menu Section ======= -->

   <section id="menu" class="menu section-bg">
  <div class="container" data-aos="fade-up">

    <div class="section-title">
      <h2>Menu</h2>
      <p>Check Our Tasty Menu</p>
    </div>

    <div class="row" data-aos="fade-up" data-aos-delay="100">
      <div class="col-lg-12 d-flex justify-content-center">
        <ul id="menu-filters">
          <li data-filter="*" class="filter-active">All</li>
          <li data-filter=".filter-Breakfast">Breakfast</li>
          <li data-filter=".filter-Lunch">Lunch</li>
          <li data-filter=".filter-Dinner">Dinner</li>
          <li data-filter=".filter-Dessert">Desserts</li>
          <li data-filter=".filter-Beverages">Beverages</li>
        </ul>
      </div>
    </div>

    <div class="row menu-container" data-aos="fade-up" data-aos-delay="200">
      <c:forEach var="product" items="${products}">
        <div class="col-lg-6 menu-item filter-${product.category}">
          <img src="${product.imagePath}" class="menu-img" alt="">
          <div class="menu-content">
            <a href="#">${product.name}</a><span>Rs ${product.price}</span>
          </div>
          <div class="menu-ingredients">
            ${product.description}
          </div>

          <!-- Check if customer is logged in -->
          <c:choose>
            <c:when test="${sessionScope.customer != null}">
              <!-- Add to Cart Form -->
              <form action="cart" method="post">
                <input type="hidden" name="productId" value="${product.productId}">
                <input type="hidden" name="quantity" value="1"> <!-- Default quantity to 1 -->
                <input type="hidden" name="action" value="add">
                <button type="submit" class="add-to-cart-btn">Add to Cart</button>
              </form>
            </c:when>
            <c:otherwise>
              <!-- Show an alert if not logged in -->
              <button class="btn btn-secondary" onclick="alertLoginMessage()">Add to Cart</button>
            </c:otherwise>
          </c:choose>
        </div>
      </c:forEach>
    </div>

  </div>
</section>

<!-- End Menu Section -->

    <!-- ======= Specials Section ======= -->
 <section id="specials" class="specials">
  <div class="container" data-aos="fade-up">

    <div class="section-title">
      <h2>Offers</h2>
      <p>Check Our Special Offers - Today</p>
    </div>

    <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="100">
      <div class="col-lg-9 mt-4 mt-lg-0">
        <div class="swiper-container">
          <div class="swiper-wrapper">

            <c:forEach var="offer" items="${offers}">
    <div class="swiper-slide">
        <div class="row">
            <div class="col-lg-8 details order-2 order-lg-1">
                <h3>${offer.name}</h3>
                <p class="fst-italic text-justify">- Exclusively Available for Online Orders - </p>
                <p>${offer.description}</p>
            </div>
            <div class="col-lg-4 text-center order-1 order-lg-2">
                <img src="${offer.image}" alt="Offer Image" class="img-fluid">
            </div>
        </div>
    </div>
</c:forEach>
            

          </div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </div>

  </div>
</section>
 
 
    <!-- End Specials Section -->

    <!-- ======= Events Section ======= -->
    <section id="events" class="events">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Services</h2>
          <p>Services We Provide to You</p>
        </div>

        <div class="events-slider swiper-container" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">

            <c:forEach var="service" items="${services}">
    <div class="swiper-slide">
        <div class="row event-item">
            <div class="col-lg-6">
                <img src="${service.image}" class="img-fluid" alt="${service.serviceName} Image">
            </div>
            <div class="col-lg-6 pt-4 pt-lg-0 content">
                <h3>${service.serviceName}</h3>
                
                <p class="fst-italic text-justify">
                    ${service.description}
                </p>
            </div>
        </div>
    </div>
</c:forEach><!-- End testimonial item -->
     </div>
          <div class="swiper-pagination"></div>
        </div>
        
        

    </section><!-- End Events Section -->

    <!-- ======= Book A Table Section ======= -->
    <section id="book-a-table" class="book-a-table">
  <div class="container" data-aos="fade-up">
    <div class="section-title">
      <h2>Reservation</h2>
      <p>Book a Table</p>
    </div>

    <!-- Form to Book a Table -->
    <form action="reservation?action=add" method="post" role="form" data-aos="fade-up" data-aos-delay="100">
      <div class="row">
        <div class="col-lg-4 col-md-6 form-group">
          <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
          <div class="validate"></div>
        </div>
        <div class="col-lg-4 col-md-6 form-group mt-3 mt-md-0">
          <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
          <div class="validate"></div>
        </div>
        <div class="col-lg-4 col-md-6 form-group mt-3 mt-md-0">
          <input type="text" class="form-control" name="phone" id="phone" placeholder="Your Phone" required>
          <div class="validate"></div>
        </div>
        <div class="col-lg-4 col-md-6 form-group mt-3">
          <input type="date" name="date" class="form-control" id="date" required>
          <div class="validate"></div>
        </div>
        <div class="col-lg-4 col-md-6 form-group mt-3">
          <input type="time" class="form-control" name="time" id="time" required>
          <div class="validate"></div>
        </div>
        <div class="col-lg-4 col-md-6 form-group mt-3">
          <input type="number" class="form-control" name="people" id="people" placeholder="# of people" min="1" required>
          <div class="validate"></div>
        </div>
      </div>
      <div class="form-group mt-3">
        <textarea class="form-control" name="message" rows="5" placeholder="Message"></textarea>
        <div class="validate"></div>
      </div>
      <div class="mb-3">
        <div class="loading">Loading</div>
        <div class="sent-message" style="display:none;">Your booking request was sent. We will call back or send an Email to confirm your reservation. Thank you!</div>
      </div>
      <div class="text-center"><button type="submit">Book a Table</button></div>
    </form>
  </div>
</section>
    
    <!-- End Book A Table Section -->

    
    <!-- ======= Gallery Section ======= -->
    <section id="gallery" class="gallery">

      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>Gallery</h2>
          <p>Some photos from Our Restaurant</p>
        </div>
      </div>

      <div class="container-fluid" data-aos="fade-up" data-aos-delay="100">

        <div class="row g-0">

          <c:forEach var="gallery" items="${galleries}">
                <div class="col-lg-3 col-md-4">
                    <div class="gallery-item">
                        <a href="${gallery.image}" class="gallery-lightbox" data-gall="gallery-item">
                            <img src="${gallery.image}" alt="Gallery Image" class="img-fluid">
                        </a>
                    </div>
                </div>
            </c:forEach>
          
       </div>

      </div>
    </section><!-- End Gallery Section -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Contact</h2>
          <p>Contact Us</p>
        </div>
      </div>

      <div data-aos="fade-up">
        <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3957.457093020949!2d80.63297137500012!3d7.3024323927053025!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae3676df00217ff%3A0xac59999a6821007e!2sICBT%20Kandy%20Campus!5e0!3m2!1sen!2slk!4v1724156482892!5m2!1sen!2slk" frameborder="0" allowfullscreen></iframe>
       </div>

      <div class="container" data-aos="fade-up">

        <div class="row mt-5">

          <div class="col-lg-4">
            <div class="info">
              <div class="address">
                <i class="bi bi-geo-alt"></i>
                <h4>Location:</h4>
                <p>A108 Adam Street, New York, NY 535022</p>
              </div>

              <div class="open-hours">
                <i class="bi bi-clock"></i>
                <h4>Open Hours:</h4>
                <p>
                  Monday-Saturday:<br>
                  11:00 AM - 2300 PM
                </p>
              </div>

              <div class="email">
                <i class="bi bi-envelope"></i>
                <h4>Email:</h4>
                <p>info@example.com</p>
              </div>

              <div class="phone">
                <i class="bi bi-phone"></i>
                <h4>Call:</h4>
                <p>+1 5589 55488 55s</p>
              </div>

            </div>

          </div>

          <div class="col-lg-8 mt-5 mt-lg-0">

            <form action="query?action=add" method="post" role="form">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                </div>
              </div>
              <div class="form-group mt-3">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="message" rows="8" placeholder="Message" required></textarea>
              </div>
              <div class="my-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
            </form>

          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->
    
    

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">

                <div class="col-lg-4 col-md-6">
                    <div class="footer-info">
                        <h4>Hours :</h4>
                        <p>
                            Mon - Thurs: 11:00am - 11:00pm<br>
                            Fri - Sun: 09:00am - 11:30pm<br>
                        </p>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="footer-info">
                        <h4>Address :</h4>
                        <p>
                            Kelambakkam - Vandalur Road<br>
                            Rajan Nagar, Chennai, Tamil Nadu 600127<br>
                        </p>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="footer-info">
                        <h4>Contact Us :</h4>
                        <div class="social-links mt-3">
                            <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                            <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                            <a href="#" class="email"><i class="bx bx-envelope"></i></a>
                            <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                        </div>
                        <p>
                            <a href="mailto:bananaleaf@gmail.com">bananaleaf@gmail.com</a>
                        </p>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="copyright">
            &copy; Copyright <strong><span>Banana Leaf</span></strong> 2020. All Rights Reserved
        </div>
    </div>
</footer>
  <!-- End Footer -->
  

  
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
</body>

<!-- Template Main JS File -->

  <script src="assets/js/main.js"></script>
  <script>
  function alertLoginMessage() {
    alert("Please log in before adding items to the cart.");
    window.location.href = 'customer?action=login'; // Redirect to the login page
  }
  

</script>

<script>
  var swiper = new Swiper('.swiper-container', {
    loop: true,
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
      bulletClass: 'swiper-pagination-bullet',
      bulletActiveClass: 'swiper-pagination-bullet-active',
    },
    autoplay: {
      delay: 5000,
      disableOnInteraction: false,
    },
  });
</script>





</html>