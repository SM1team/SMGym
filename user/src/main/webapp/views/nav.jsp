<!-- nav.jsp -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="#page-top">
            <img src="<c:url value='/assets/img/navbar-logo.svg'/>" alt="Navbar Logo" />
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars ms-1"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="#trainer">Trainer Profile</a></li>
                <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#location">Location</a></li>
                <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>

                <!-- Dropdown for Sign In and Sign Up -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Account
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="<c:url value='/login'/>">Login</a></li>
                        <li><a class="dropdown-item" href="<c:url value='/register'/>">Sign Up</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
