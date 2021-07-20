


<?php

class ControllerInformationReviews extends Controller
{
   
	public function index() {
 
        $this->load->language('information/reviews');

        $this->document->setTitle($this->language->get('Title'));
         
        $data['breadcrumbs'] = array();
         
         
        if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

        $data['breadcrumbs'][] = array(
        'text' => $this->language->get('heading_title'),
        'href' => $this->url->link('information/reviews')
        );

        
      
        $this->load->language('product/product');
    
        $this->load->model('catalog/review');

        $this->load->model('tool/image');
        
        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }
        if (isset($this->request->get['product_id'])) {
            $product_id = $this->request->get['product_id'];
        } else {
            $product_id = 0;
        }

        $product_id = 54;
        $data['reviews'] = array();


        
        
	


        $results = $this->model_catalog_review->getTotalAllReviewsByProductId();

        if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.png', 40, 40);
			}
            $data['reviews'][] = array(
                'author'     => $result['author'],
                'text'       => nl2br($result['text']),
                'image'     => $image,
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
            );
        }



       
     
        
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
         
        $this->response->setOutput($this->load->view('information/reviews', $data));
        

        }
    
}