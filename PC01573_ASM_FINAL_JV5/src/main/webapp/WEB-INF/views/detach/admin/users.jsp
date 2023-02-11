<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>		
<div class="container-fluid px-4">
	<h1 class="mt-4">USERS MANAGERS</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
		<li class="breadcrumb-item active">Users</li>
	</ol>
	<div class="card mb-4">
		<div class="card-body">Trình quản lý User .</div>
	</div>
	<div class="card mb-4">
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">Username
				</label> <input type="text" class="form-control"
				id="exampleFormControlInput1" >
		</div>
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">Password
				</label> <input type="text" class="form-control"
				id="exampleFormControlInput1" >
		</div>
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">Fullname
				</label> <input type="text" class="form-control"
				id="exampleFormControlInput1" >
		</div>
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">Email
			</label> <input type="email" class="form-control"
				id="exampleFormControlInput1" placeholder="name@example.com">
		</div>
		
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-primary me-md-2" type="button">UPDATE</button>
			<button class="btn btn-primary me-md-2" type="button">DELETE</button>
		</div>
	</div>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table me-1"></i> USER LIST
		</div>
		<div class="card-body">
			<table class="table table-bordered border-primary">
				<thead>
					<tr>
						<th scope="col">Username</th>
						<th scope="col">Password</th>
						<th scope="col">Fullname</th>
						<th scope="col">Email</th>
						<th scope="col">Role</th>
						<th scope="col">MANAGER</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
						<td>@mdo</td>
						<td>@mdo</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>@fat</td>
						<td>@mdo</td>
						<td>@mdo</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>Larry the Bird</td>
						<td>@twitter</td>
						<td>@mdo</td>
						<td>@mdo</td>
						<td>@mdo</td>
					</tr>
				</tbody>
			</table>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-danger me-md-2" type="button">|<</button>
			<button class="btn btn-danger me-md-2" type="button"><<</button>
			<button class="btn btn-danger me-md-2" type="button">>></button>
			<button class="btn btn-danger me-md-2" type="button">>|</button>
		</div>
		</div>
	</div>
</div>