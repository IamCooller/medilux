<?php
class ModelExtensionModuleNewsletter extends Model {
	public function checkExist($data) {
	   $query=$this->db->query("SELECT * FROM " . DB_PREFIX . "newsletter where email='" . $data['email'] . "' AND name='" . $data['name'] . "'");
	   return $query->num_rows;
	}
	
	public function checkRegistered($data) {
	   $query=$this->db->query("SELECT * FROM " . DB_PREFIX . "newsletter where email='" . $data['email'] . "' AND name='" . $data['name'] . "'");
	   return $query->num_rows;
	}
	
	public function UpdateRegistered($data,$status) {
	   $query=$this->db->query("UPDATE  " . DB_PREFIX . "newsletter SET newsletter ='" . $status . "' where email='" . $data['email'] . "' AND name='" . $data['name'] . "'");
	}
		
	public function subscribe($data) {
		   $this->db->query("INSERT INTO " . DB_PREFIX . "newsletter SET 
		   email='" .$data['email'] . "', name='" . $data['name'] . "'");
	}
	
	public function unsubscribe($data) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "newsletter WHERE email='" . $data['email'] . "' AND name='" . $data['name'] . "'");
	}
   
}