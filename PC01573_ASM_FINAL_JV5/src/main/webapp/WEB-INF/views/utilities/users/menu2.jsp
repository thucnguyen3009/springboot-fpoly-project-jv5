<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 100%; height: 100vh; margin-top: 100px;">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-4">Danh Mục Quản Lý</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="/botxxii/myaccount" class="nav-link link-dark ${active1}" aria-current="page">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
          Thông tin tài khoản
        </a>
      </li>
      <li>
        <a href="/botxxii/addresses" class="nav-link link-dark ${active2}" >
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
          Địa Chỉ
        </a>
      </li>
      <li>
        <a href="/botxxii/profilechangepass" class="nav-link link-dark ${active3}" >
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"></use></svg>
          Đổi mật khẩu
        </a>
      </li>
      <li>
        <a href="#" class="nav-link link-dark ${active4}">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"></use></svg>
          Đơn mua
        </a>
      </li>
    </ul>
</div>