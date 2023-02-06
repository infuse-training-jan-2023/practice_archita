import { React, useEffect, useState } from "react";
import { Route, Routes } from "react-router-dom";

function ViewUsers() {
  const [users, setUsers] = useState([])

  const getUsers = async () => {
    try {
      const res = await fetch("http://localhost:5000/view_users")
      const data = await res.json()
      setUsers(data)
      // console.log(data)
    }
    catch(error) {
      console.error(error)
    }
  }

  useEffect(() => {
    getUsers()
  }, []) 

  return (
    <>
      <h2 class="text-center my-2">View Users</h2>
      {
        users && users.length > 0 && users.map((user) => {
          return (
            <>
            <p>Name: {user.name}</p>
            <p>Mobile No: {user.mob_no}</p>
            <p>City: {user.city}</p>
            <br/>
            </>
          )
        })
      }
      <a href="http://localhost:3000/add_user" class="btn btn-primary">Add User</a> 
    </>
  )
}

function AddUser() {
  return (
    <>
      <h2 class="text-center my-2">Add Users</h2>
      <form action="http://localhost:5000/add_user" method="post">
        <div class="mb-3">
          <label for="user_name" class="form-label">User Name</label>
          <input type="text" class="form-control" id="user_name" name="user_name" required/>
        </div>
        <div class="mb-3">
          <label for="mob_no" class="form-label">Mob No.</label>
          <input type="text" class="form-control" id="mob_no" name="mob_no" pattern="[0-9]{10}" required/>
        </div>
        <div class="mb-3">
          <label for="city" class="form-label">City</label>
          <input type="text" class="form-control" id="city" name="city" required/>
        </div>
        <button type="submit" class="btn btn-success">Submit</button>
        <button type="reset" class="btn btn-primary mx-2">Reset</button>
        <a href="http://localhost:3000/view_users" class="btn btn-primary mx-2">View Users</a> 
      </form>
    </>
  );
}

function App() {
  return (
    <div className="container">
      {/* <ViewUsers/> */}
      <Routes>
        <Route path="/add_user" element={<AddUser />} />
        <Route path="/view_users" element={<ViewUsers />} />
      </Routes>
    </div>
  );
}

export default App;
