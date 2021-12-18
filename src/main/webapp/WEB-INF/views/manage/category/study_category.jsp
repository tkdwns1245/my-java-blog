<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="manage-container">
	<div class="manage-top-wrapper">
		<div class="manage-btn-area" style="float:right;margin-bottom:30px;">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createModal">
			  Add
			</button>
		</div>
	</div>
	<div class="manage-table-wrapper">
		<table class="table">
			<colgroup>
				<col style="width:10%;">
				<col style="width:50%;">
				<col style="width:20%;">
				<col style="width:20%;">
			</colgroup>
			<thead class="thead-dark">
				<tr>
					<th scope="col">#</th>
					<th scope="col">Name</th>
					<th scope="col">Seq</th>
					<th scope="col">Setting</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>
						<a class="btn btn-danger" style="margin-right:30px;">delete</a>
						<a class="btn btn-primary">edit</a>
					</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>Larry</td>
					<td>the Bird</td>
					<td>@twitter</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="modal" id="createModal" tabindex="-1" role="dialog" id="Create Study ">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Create Study category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="input-area row">
			<div class="col-2">Name</div>
			<div class="col-10">
				 <input type="text" name="name" class="form-control">
			</div>
		</div>
		<div class="input-area row">
			<div class="col-2">Seq</div>
			<div class="col-10">
				 <input type="text" name="seq" class="form-control">
			</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
