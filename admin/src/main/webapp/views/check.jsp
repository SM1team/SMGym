<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Striped Table</h4>
                        <p class="card-description"> Add class <code>.table-striped</code>
                        </p>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th> User</th>
                                    <th> First name</th>
                                    <th> Progress</th>
                                    <th> Amount</th>
                                    <th> Deadline</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="py-1">
                                        <img src="../../assets/images/faces/face1.jpg" alt="image"/>
                                    </td>
                                    <td> Herman Beck</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-success" role="progressbar" style="width: 25%"
                                                 aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td> $ 77.99</td>
                                    <td> May 15, 2015</td>
                                </tr>
                                <tr>
                                    <td class="py-1">
                                        <img src="../../assets/images/faces/face2.jpg" alt="image"/>
                                    </td>
                                    <td> Messsy Adam</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-danger" role="progressbar" style="width: 75%"
                                                 aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td> $245.30</td>
                                    <td> July 1, 2015</td>
                                </tr>
                                <tr>
                                    <td class="py-1">
                                        <img src="../../assets/images/faces/face3.jpg" alt="image"/>
                                    </td>
                                    <td> John Richards</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-warning" role="progressbar" style="width: 90%"
                                                 aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td> $138.00</td>
                                    <td> Apr 12, 2015</td>
                                </tr>
                                <tr>
                                    <td class="py-1">
                                        <img src="../../assets/images/faces/face4.jpg" alt="image"/>
                                    </td>
                                    <td> Peter Meggik</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-primary" role="progressbar" style="width: 50%"
                                                 aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td> $ 77.99</td>
                                    <td> May 15, 2015</td>
                                </tr>
                                <tr>
                                    <td class="py-1">
                                        <img src="../../assets/images/faces/face5.jpg" alt="image"/>
                                    </td>
                                    <td> Edward</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-danger" role="progressbar" style="width: 35%"
                                                 aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td> $ 160.25</td>
                                    <td> May 03, 2015</td>
                                </tr>
                                <tr>
                                    <td class="py-1">
                                        <img src="../../assets/images/faces/face6.jpg" alt="image"/>
                                    </td>
                                    <td> John Doe</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-info" role="progressbar" style="width: 65%"
                                                 aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td> $ 123.21</td>
                                    <td> April 05, 2015</td>
                                </tr>
                                <tr>
                                    <td class="py-1">
                                        <img src="../../assets/images/faces/face7.jpg" alt="image"/>
                                    </td>
                                    <td> Henry Tom</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-warning" role="progressbar" style="width: 20%"
                                                 aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td> $ 150.00</td>
                                    <td> June 16, 2015</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Bordered table</h4>
                        <p class="card-description"> Add class <code>.table-bordered</code>
                        </p>
                        <div class="table-responsive pt-3">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th> #</th>
                                    <th> First name</th>
                                    <th> Progress</th>
                                    <th> Amount</th>
                                    <th> Deadline</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td> 1</td>
                                    <td> Herman Beck</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-success" role="progressbar" style="width: 25%"
                                                 aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td> $ 77.99</td>
                                    <td> May 15, 2015</td>
                                </tr>
                                <tr>
                                    <td> 2</td>
                                    <td> Messsy Adam</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-danger" role="progressbar" style="width: 75%"
                                                 aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td> $245.30</td>
                                    <td> July 1, 2015</td>
                                </tr>
                                <tr>
                                    <td> 3</td>
                                    <td> John Richards</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-warning" role="progressbar" style="width: 90%"
                                                 aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td> $138.00</td>
                                    <td> Apr 12, 2015</td>
                                </tr>
                                <tr>
                                    <td> 4</td>
                                    <td> Peter Meggik</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-primary" role="progressbar" style="width: 50%"
                                                 aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td> $ 77.99</td>
                                    <td> May 15, 2015</td>
                                </tr>
                                <tr>
                                    <td> 5</td>
                                    <td> Edward</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-danger" role="progressbar" style="width: 35%"
                                                 aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td> $ 160.25</td>
                                    <td> May 03, 2015</td>
                                </tr>
                                <tr>
                                    <td> 6</td>
                                    <td> John Doe</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-info" role="progressbar" style="width: 65%"
                                                 aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td> $ 123.21</td>
                                    <td> April 05, 2015</td>
                                </tr>
                                <tr>
                                    <td> 7</td>
                                    <td> Henry Tom</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-warning" role="progressbar" style="width: 20%"
                                                 aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td> $ 150.00</td>
                                    <td> June 16, 2015</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

    <!-- content-wrapper ends -->
    <!-- partial:../../partials/_footer.html -->

    <!-- partial -->
</div>
<!-- main-panel ends -->
</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
<script src="../../assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="../../assets/js/off-canvas.js"></script>
<script src="../../assets/js/template.js"></script>
<script src="../../assets/js/settings.js"></script>
<script src="../../assets/js/hoverable-collapse.js"></script>
<script src="../../assets/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<!-- End custom js for this page-->
</body>
</html>