<!-- nav.jsp -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="<c:url value="/"/>">
            <img src="<c:url value='/assets/img/navbar-logo.svg'/>" alt="Navbar Logo" />
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars ms-1"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">

                <li class="nav-item"><a class="nav-link" href="<c:url value='/#services'/>">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value='/#trainer'/>">Trainer</a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value='/#about'/>">About</a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value='/#location'/>">Location</a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="/floor"/>">FloorMap</a></li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/shop'/>#center">Shop</a> <!-- Shop 버튼에 #center 추가 -->
                </li>

                <!-- Dropdown for Community and Notice -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="communityDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Board
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="communityDropdown">
                        <li><a class="dropdown-item" href="<c:url value="/board"/>">Community</a></li>
                        <li><a class="dropdown-item" href="<c:url value="/notice"/>">Notice</a></li>
                    </ul>
                </li>

                <li class="nav-item"><a class="nav-link" href="<c:url value="/qna"/>">Q&A</a></li>

                <!-- Dropdown for Sign In and Sign Up -->
              <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        Account
    </a>
    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
        <c:choose>
            <c:when test="${sessionScope.loginid == null}">
                <li><a class="dropdown-item" href="<c:url value='/login'/>">Login</a></li>
                <li><a class="dropdown-item" href="<c:url value='/register'/>">Sign Up</a></li>
            </c:when>
            <c:otherwise>
                <li><a class="dropdown-item" href="<c:url value="/mypage"/>">${sessionScope.loginid.custId}</a></li>
                <li><a class="dropdown-item" href="<c:url value="/logoutimpl"/>">Logout</a></li>
                <c:choose>
                    <c:when test="${sessionScope.hasPT}">
                        <li><a class="dropdown-item" href="<c:url value='/pt'/>">PT Page</a></li>
                    </c:when>
                </c:choose>
                <li><a class="dropdown-item" href="<c:url value="/workout"/>">Workout Log</a></li>
                <li><a class="dropdown-item" href="<c:url value="/qr"/>">QR code</a></li>
                <li><a class="dropdown-item" href="<c:url value="/webcam"/>">Check in</a></li>
                <li><a class="dropdown-item" href="<c:url value="/webcam2"/>">Check out</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</li>

            </ul>
        </div>
    </div>
</nav>
