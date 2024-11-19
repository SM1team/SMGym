<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div>
  <nav class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="sidebar">
    <ul class="nav">
      <li class="nav-item">
        <a class="nav-link" href="/">
          <i class="mdi mdi-grid-large menu-icon"></i>
          <span class="menu-title">Control Board</span>
        </a>
      </li>

      <li class="nav-item nav-category">여기서 UI 패널 조절</li>
<%--      첫번째 항목--%>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
           aria-controls="ui-basic">
          <i class="menu-icon mdi mdi-floor-plan"></i>
          <span class="menu-title">첫번째 항목 조절</span>
          <i class="menu-arrow"></i>
        </a>
        <div class="collapse" id="ui-basic">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"><a class="nav-link" href="pages/ui-features/buttons.html">Buttons</a>
            </li>
            <li class="nav-item"><a class="nav-link"
                                    href="pages/ui-features/dropdowns.html">Dropdowns</a></li>
            <li class="nav-item"><a class="nav-link"
                                    href="pages/ui-features/typography.html">Typography</a></li>
          </ul>
        </div>
      </li>
<%--두번째 항목--%>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#form-elements" aria-expanded="false"
           aria-controls="form-elements">
          <i class="menu-icon mdi mdi-card-text-outline"></i>
          <span class="menu-title">Form elements</span>
          <i class="menu-arrow"></i>
        </a>
        <div class="collapse" id="form-elements">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"><a class="nav-link" href="pages/forms/basic_elements.html">Basic
              Elements</a></li>
          </ul>
        </div>
      </li>

<%--      세번째 항목--%>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#charts" aria-expanded="false"
           aria-controls="charts">
          <i class="menu-icon mdi mdi-chart-line"></i>
          <span class="menu-title">Charts</span>
          <i class="menu-arrow"></i>
        </a>
        <div class="collapse" id="charts">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"><a class="nav-link" href="pages/charts/chartjs.html">ChartJs</a></li>
          </ul>
        </div>
      </li>
<%--      네번째 항목--%>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#tables" aria-expanded="false"
           aria-controls="tables">
          <i class="menu-icon mdi mdi-table"></i>
          <span class="menu-title">Tables</span>
          <i class="menu-arrow"></i>
        </a>
        <div class="collapse" id="tables">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"><a class="nav-link" href="pages/tables/basic-table.html">Basic
              table</a></li>
          </ul>
        </div>
      </li>
<%--      다섯번째 항목--%>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#icons" aria-expanded="false"
           aria-controls="icons">
          <i class="menu-icon mdi mdi-layers-outline"></i>
          <span class="menu-title">Icons</span>
          <i class="menu-arrow"></i>
        </a>
        <div class="collapse" id="icons">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"><a class="nav-link" href="pages/icons/font-awesome.html">Font
              Awesome</a></li>
          </ul>
        </div>
      </li>
<%--      여섯 번째 항목--%>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false"
           aria-controls="auth">
          <i class="menu-icon mdi mdi-account-circle-outline"></i>
          <span class="menu-title">User Pages</span>
          <i class="menu-arrow"></i>
        </a>
        <div class="collapse" id="auth">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"><a class="nav-link" href="pages/samples/blank-page.html"> Blank
              Page </a></li>
            <li class="nav-item"><a class="nav-link" href="pages/samples/error-404.html"> 404 </a></li>
            <li class="nav-item"><a class="nav-link" href="pages/samples/error-500.html"> 500 </a></li>
            <li class="nav-item"><a class="nav-link" href="pages/samples/login.html"> Login </a></li>
            <li class="nav-item"><a class="nav-link" href="pages/samples/register.html"> Register </a>

            </li>
          </ul>
        </div>
      </li>
<%--항목 생성시 참고 하면 되는 예시--%>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#(원래는 icons 가 있었는데 작동시 중첩되서 삭제함)" aria-expanded="false"
           aria-controls="icons">
          <i class="menu-icon mdi mdi-layers-outline"></i>
          <span class="menu-title">Icons</span>
          <i class="menu-arrow"></i>
        </a>
        <div class="collapse" id="#(원래는 icons 가 있었는데 작동시 중첩되서 삭제함)">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"><a class="nav-link" href="pages/icons/font-awesome.html">Font
              Awesome</a></li>
          </ul>
        </div>
      </li>

      <%--첫번째 페이지 이동--%>
      <li class="nav-item">
        <a class="nav-link" href="docs/documentation.html">
          <i class="menu-icon mdi mdi-file-document"></i>
          <span class="menu-title">Documentation</span>
        </a>
      </li>
      <%--두번째 페이지 이동--%>
      <li class="nav-item">
        <a class="nav-link" href="/websocket">
          <i class="menu-icon mdi mdi-file-document"></i>
          <span class="menu-title">Web Socket</span>
        </a>
      </li>
    </ul>
  </nav>
</div>

