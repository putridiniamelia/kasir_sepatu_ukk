<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<?=base_url('assets/images/logo/logo3.png'); ?>" type="image/x-icon" />
    <title>Kasir Toko Sepatu</title>

    <!-- ========== All CSS files linkup ========= -->
    <link rel="stylesheet" href="<?=base_url('assets/css/bootstrap.min.css'); ?>" />
    <link rel="stylesheet" href="<?=base_url('assets/css/lineicons.css'); ?>" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="<?=base_url('assets/css/materialdesignicons.min.css'); ?>" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="<?=base_url('assets/css/main.css'); ?>" />
    <link rel="stylesheet" href="<?=base_url('assets/css/style.css'); ?>" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
   
    
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<?=base_url('select2/css/select2..min.css');?>">
    <!-- <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
 <style>
  a {
    text-decoration:none;
  }
 </style>
  </head>
  <body>
    <!-- ======== sidebar-nav start =========== -->
    <aside class="sidebar-nav-wrapper">
      <div class="navbar-logo">
          <img src="<?=base_url('assets/images/logo/logo1.png'); ?>" alt="logo" />
      </div>
      <nav class="sidebar-nav">
        <ul>
          <li class="nav-item">
            <a href="dashboard">
              <span class="icon">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M8.74999 18.3333C12.2376 18.3333 15.1364 15.8128 15.7244 12.4941C15.8448 11.8143 15.2737 11.25 14.5833 11.25H9.99999C9.30966 11.25 8.74999 10.6903 8.74999 10V5.41666C8.74999 4.7263 8.18563 4.15512 7.50586 4.27556C4.18711 4.86357 1.66666 7.76243 1.66666 11.25C1.66666 15.162 4.83797 18.3333 8.74999 18.3333Z" />
                  <path
                    d="M17.0833 10C17.7737 10 18.3432 9.43708 18.2408 8.75433C17.7005 5.14918 14.8508 2.29947 11.2457 1.75912C10.5629 1.6568 10 2.2263 10 2.91665V9.16666C10 9.62691 10.3731 10 10.8333 10H17.0833Z" />
                </svg>
              </span>
              <span class="dashboard">Dashboard</span>
            </a>
          </li>
          
          <li class="nav-item nav-item-has-children">
            <a
              href="#0"
              class="collapsed"
              data-bs-toggle="collapse"
              data-bs-target="#ddmenu_4"
              aria-controls="ddmenu_4"
              aria-expanded="false"
              aria-label="Toggle navigation"
            >
              <span class="icon">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M1.66666 5.41669C1.66666 3.34562 3.34559 1.66669 5.41666 1.66669C7.48772 1.66669 9.16666 3.34562 9.16666 5.41669C9.16666 7.48775 7.48772 9.16669 5.41666 9.16669C3.34559 9.16669 1.66666 7.48775 1.66666 5.41669Z" />
                  <path
                    d="M1.66666 14.5834C1.66666 12.5123 3.34559 10.8334 5.41666 10.8334C7.48772 10.8334 9.16666 12.5123 9.16666 14.5834C9.16666 16.6545 7.48772 18.3334 5.41666 18.3334C3.34559 18.3334 1.66666 16.6545 1.66666 14.5834Z" />
                  <path
                    d="M10.8333 5.41669C10.8333 3.34562 12.5123 1.66669 14.5833 1.66669C16.6544 1.66669 18.3333 3.34562 18.3333 5.41669C18.3333 7.48775 16.6544 9.16669 14.5833 9.16669C12.5123 9.16669 10.8333 7.48775 10.8333 5.41669Z" />
                  <path
                    d="M10.8333 14.5834C10.8333 12.5123 12.5123 10.8334 14.5833 10.8334C16.6544 10.8334 18.3333 12.5123 18.3333 14.5834C18.3333 16.6545 16.6544 18.3334 14.5833 18.3334C12.5123 18.3334 10.8333 16.6545 10.8333 14.5834Z" />
                </svg>
              </span>
              <span class="text">Master Data</span>
            </a>
            <ul id="ddmenu_4" class="collapse dropdown-nav">
            <?php if(session()->get('level')=='admin'){ ?>
              <li>
                <a href="<?=site_url('lihat-user'); ?>"> Pengguna </a>
              </li>
              <?php } ?>

              <li>
                <a href="<?=site_url('lihat-produk'); ?>"> Produk </a>
              </li>

              <?php if(session()->get('level')=='admin'){ ?>
              <li>
                <a href="<?=site_url('lihat-kategori'); ?>"> Kategori </a>
              </li>
              <?php } ?>

              <?php if(session()->get('level')=='admin'){ ?>
              <li>
                <a href="<?=site_url('lihat-satuan'); ?>"> Satuan </a>
              </li>
              <?php } ?>
            </ul>
          </li>

          <li class="nav-item nav-item-has-children">
            <a
              href="#0"
              class="collapsed"
              data-bs-toggle="collapse"
              data-bs-target="#ddmenu_2"
              aria-controls="ddmenu_2"
              aria-expanded="false"
              aria-label="Toggle navigation"
            >
              <span class="icon">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M11.8097 1.66667C11.8315 1.66667 11.8533 1.6671 11.875 1.66796V4.16667C11.875 5.43232 12.901 6.45834 14.1667 6.45834H16.6654C16.6663 6.48007 16.6667 6.50186 16.6667 6.5237V16.6667C16.6667 17.5872 15.9205 18.3333 15 18.3333H5.00001C4.07954 18.3333 3.33334 17.5872 3.33334 16.6667V3.33334C3.33334 2.41286 4.07954 1.66667 5.00001 1.66667H11.8097ZM6.66668 7.70834C6.3215 7.70834 6.04168 7.98816 6.04168 8.33334C6.04168 8.67851 6.3215 8.95834 6.66668 8.95834H10C10.3452 8.95834 10.625 8.67851 10.625 8.33334C10.625 7.98816 10.3452 7.70834 10 7.70834H6.66668ZM6.04168 11.6667C6.04168 12.0118 6.3215 12.2917 6.66668 12.2917H13.3333C13.6785 12.2917 13.9583 12.0118 13.9583 11.6667C13.9583 11.3215 13.6785 11.0417 13.3333 11.0417H6.66668C6.3215 11.0417 6.04168 11.3215 6.04168 11.6667ZM6.66668 14.375C6.3215 14.375 6.04168 14.6548 6.04168 15C6.04168 15.3452 6.3215 15.625 6.66668 15.625H13.3333C13.6785 15.625 13.9583 15.3452 13.9583 15C13.9583 14.6548 13.6785 14.375 13.3333 14.375H6.66668Z" />
                  <path
                    d="M13.125 2.29167L16.0417 5.20834H14.1667C13.5913 5.20834 13.125 4.74197 13.125 4.16667V2.29167Z" />
                </svg>
              </span>
              <span class="text">Transaksi</span>
            </a>
            <ul id="ddmenu_2" class="collapse dropdown-nav">
              <li>
                <a href="<?=site_url('lihat-penjualan'); ?>"> Penjualan </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="<?=site_url('lihat-laporan'); ?>"> 
              <i class="lni lni-printer"></i> Laporan </a>
          </li>
        </ul>
      </nav>
    </aside>
    <div class="overlay"></div>
    <!-- ======== sidebar-nav end =========== -->
        
                <!-- profile start -->
                <div class="profile-box ml-15">
                  <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profile">
                    <li class="divider"></li>
                    <li>
                      <a href="#0"> <i class="lni lni-exit"></i> Sign Out </a>
                    </li>
                  </ul>
                </div>
                <!-- profile end -->
              </div>
            </div>
          </div>
        </div>
      </header>
      <!-- ========== header end ========== -->
      <!-- ========== section start ========== -->
      <section class="section">
        <div class="container-fluid">
          <!-- ========== title-wrapper start ========== -->
          <div class="title-wrapper pt-30">
            <div class="row align-items-center">
              <!-- end col -->
            </div>
            <!-- end row -->
          </div>
        <main class="main-wrapper">
            <!-- ========== header start ========== -->
            <header class="header">
                <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-5 col-md-5 col-6">
                    <div class="header-left d-flex align-items-center">
                        <div class="menu-toggle-btn mr-15">
                        <button id="menu-toggle" class="main-btn primary-btn btn-hover">
                            <i class="lni lni-chevron-left me-2"></i> Menu
                        </button>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-7 col-md-7 col-6">
                    <div class="header-right">

                        <!-- profile start -->
                      <div class="profile-box ml-15">
                          <button class="dropdown-toggle bg-transparent border-0" type="button" id="profile" data-bs-toggle="dropdown" aria-expanded="false">
                              <div class="profile-info">
                                  <div class="info">
                                      <div class="image">
                                          <img src="Ini Ini-user" alt="" />
                                      </div>
                                      <div>
                                          <h6 class="fw-500"><?= session()->get('nama_user'); ?></h6>
                                          <p><?= session()->get('email'); ?></p>
                                      </div>
                                  </div>
                              </div>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profile">
                              <li>
                                  <div class="author-info flex items-center !p-1">
                                      <div class="image">
                                          <img src="assets/images/profile/profile-image.png" alt="">
                                      </div>
                                      <div class="content">
                                          <label class="text-black/40 dark:text-white/40 hover:text-black dark:hover:text-white text-xs"><?= session()->get('nama_user'); ?></label>
                                      </div>
                                  </div>
                              </li>
                              <li class="divider"></li>
                              <li>
                                  <a href="#0">
                                      <i class="lni lni-user"></i> View Profile
                                  </a>
                              </li>
                              <li class="divider"></li>
                              <li>
                                  <a href="<?= site_url('logout'); ?>"> <i class="lni lni-exit"></i> Log Out </a>
                              </li>
                          </ul>
                      </div>
                      <!-- profile end -->
                    </div>
                    </div>
                </div>
                </div>
            </header>
            <script src="<?=base_url('select2/js/select2.js');?>"></script>
            <script src="<?=base_url('assets/js/jquery_mask/dist/jquery.mask.js');?>"></script>

  
        <!-- ========== header end ========== -->

        <?=$this->renderSection('content'); ?>

              <!-- ========== footer start =========== -->
      <footer class="footer">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-6 order-last order-md-first">
              <div class="copyright text-center text-md-start">
                <p class="text-sm">
                  Designed and Developed by
                  <a href rel="nofollow" target="_blank">
                    Shoes Store
                  </a>
                </p>
              </div>
            </div>
            <!-- end col-->
          </div>
          <!-- end row -->
        </div>
        <!-- end container -->
      </footer>
      <!-- ========== footer end =========== -->
    </main>
    <!-- ======== main-wrapper end =========== -->

    <script>
      $(document).ready(function(){
        $('.js-example-basic-single').select2();
      });
    </script>
    <!-- ========= All Javascript files linkup ======== -->
    <script src="<?=base_url('assets/js/bootstrap.bundle.min.js'); ?>"></script>
    <script src="<?=base_url('assets/js/moment.min.js'); ?>"></script>
    <script src="<?=base_url('assets/js/jvectormap.min.js'); ?>"></script>
    <script src="<?=base_url('assets/js/world-merc.js'); ?>"></script>
    <script src="<?=base_url('assets/js/polyfill.js'); ?>"></script>
    <script src="<?=base_url('assets/js/main.js'); ?>"></script>
    <script src="<?=base_url('select2/js/i18n/select2.min.js'); ?>"></script>
    
    <!--Master Data-->
    <!-- <?php if(session()->get('level')=='admin'){ ?>
            <li class="menu-title">Master Data</li>
            <li>
              <a href="?>=site_url('lihat-user');?>">
            </li>
            </li>

            <?php } ?>

            <?php if(session()->get('level')=='admin'){ ?>
            <li class="menu-title">Produk</li>
            <li>
              <a href="?>=site_url('lihat-kategori');?>">
            </li>
            </li>

            <?php } ?> -->
            </body>
        </html>