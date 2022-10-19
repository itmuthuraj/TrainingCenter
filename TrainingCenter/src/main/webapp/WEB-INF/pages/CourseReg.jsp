<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
          
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>

.card-registration .select-input.form-control[readonly]:not([disabled]) {
font-size: 1rem;
line-height: 2.15;
padding-left: .75em;
padding-right: .75em;
}
.card-registration .select-arrow {
top: 13px;
}
</style>


<body>
<form action="" method="post">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<section class="h-100 bg-dark">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card card-registration my-4">
          <div class="row g-0">
            <div class="col-xl-6 d-none d-xl-block">
              <img src="Image/reg.jpg" alt="" class="img-fluid"
                style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
            </div>
            <div class="col-xl-6">
              <div class="card-body p-md-5 text-black">
                <h3 class="mb-5 text-uppercase">Add New Course</h3>
                
                <div class="row">
                  <div class="col-md-4 mb-4">
                    <div class="form-outline">
                     
                     <h6> <label class="form-label" for="form3Example1m">Course Name</label></h6>
                    </div>
                  </div>
                  <div class="col-md-8 mb-4">
                    <div class="form-outline">
                  <input type="text" id="form3Example1n1" class="form-control form-control-lg" name="pName" />
                      
                    </div>
                  </div>
                </div>
                
                
                <div class="row">
                  <div class="col-md-4 mb-4">
                    <div class="form-outline">
                     
                     <h6> <label class="form-label" for="form3Example1m">Course Description</label></h6>
                    </div>
                  </div>
                  <div class="col-md-8 mb-4">
                    <div class="form-outline">
                  
                  <input type="text" id="form3Example1n1" class="form-control form-control-lg" name="pDate" />
                      
                    </div>
                  </div>
                </div>
                
                <div class="row">
                  <div class="col-md-4 mb-4">
                    <div class="form-outline">
                     
                     <h6> <label class="form-label" for="form3Example1m">Course Fee</label></h6>
                    </div>
                  </div>
                  <div class="col-md-8 mb-4">
                    <div class="form-outline">
                  
                  <input type="text" id="form3Example1n1" class="form-control form-control-lg" name="pAge" />
                      
                    </div>
                  </div>
                </div>
                
      

                
                
  <div class="d-flex justify-content-end pt-3">
                  <button type="reset" class="btn btn-light btn-lg">Reset all</button>
                  <button type="submit" class="btn btn-warning btn-lg ms-2">Submit form</button>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</form>

</body>
</html>