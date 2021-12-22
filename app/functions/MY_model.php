<?php

$conn = mysqli_connect('localhost', 'root', '', 'simrs');

function get($query)
{
  global $conn;

  $query = mysqli_query($conn, $query);
  $rows = [];

  while ($row = mysqli_fetch_assoc($query)) {
    $rows[] = $row;
  }

  return $rows;
}

function get_where($query)
{
  global $conn;

  $query = mysqli_query($conn, $query);
  $row = mysqli_fetch_assoc($query);
  return $row;
}

function get_count($query)
{
    global $conn;

    $query = mysqli_query($conn, $query);
    $jumlah = mysqli_fetch_assoc($query);
    return $jumlah['total'];
}

function create($query)
{
  global $conn;

  $query = mysqli_query($conn, $query);

  return mysqli_affected_rows($conn);
}

function delete($query)
{
  global $conn;

  $query = mysqli_query($conn, $query);
  return mysqli_affected_rows($conn);
}

function register()
{
  global $conn;

  $username = 'admin';
  $password = password_hash('admin', PASSWORD_DEFAULT);
  $created_at = date('Y-m-d H:i:s');

  mysqli_query($conn, "INSERT INTO users VALUES('', '1', '$username', '$password', '', '$created_at')");
  return mysqli_affected_rows($conn);
}
