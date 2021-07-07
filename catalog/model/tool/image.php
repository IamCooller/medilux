<?php
class ModelToolImage extends Model {
    public function resize($filename, $width, $height) {


        if ($this->request->server['HTTPS']) {
            return $this->config->get('config_ssl') . 'image/' . $filename;
        } else {
            return $this->config->get('config_url') . 'image/' . $filename;
        }
    }
}