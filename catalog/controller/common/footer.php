<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}
		$data['base'] = $server;
		$data['contact'] = $this->url->link('information/contact');
		$data['review_link'] = $this->url->link('information/reviews');
		$data['news_link'] = $this->url->link('blog/home');
		$data['special_link'] = $this->url->link('product/special');
		
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['catalog_link'] = $this->url->link('product/category', 'path=59'); 
		$data['about_link'] = $this->url->link('information/information', 'information_id=10');
		$data['police_link'] = $this->url->link('information/information', 'information_id=13');
		$data['tracking'] = $this->url->link('information/tracking');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/login', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);
		$data['theme_url'] = 'catalog/view/theme/medilux';
		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		$data['telephone'] = $this->config->get('config_telephone');
		$data['mail'] = $this->config->get('config_email');
		
		$data['inst'] = $this->config->get('config_inst');
		$data['facebook'] = $this->config->get('config_faceebook');
		$data['vk'] = $this->config->get('config_vk');

		$data['logo_footer'] = $this->config->get('config_footerLogo');
		if (is_file(DIR_IMAGE . $this->config->get('config_footerLogo'))) {
			$data['logo_footer'] = $server . 'image/' . $this->config->get('config_footerLogo');
		} else {
			$data['logo_footer'] = '';
		}

		$data['logo'] = $this->config->get('config_logo');
		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}


		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = ($this->request->server['HTTPS'] ? 'https://' : 'http://') . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		$data['scripts'] = $this->document->getScripts('footer');
		
		return $this->load->view('common/footer', $data);
	}

	public function send_form() {

		$json = array();
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['phone2']) < 6) || (utf8_strlen($this->request->post['phone2']) > 2500)) {
				$json['error'] = 'Заполните пожалуйста номер телефона';
			}
					
			if (preg_match("/^(([a-zA-Z-]{1,30})|([а-яА-ЯЁёІіЇїҐґЄє-]{1,30}))$/u", ($this->request->post['nameTop']))) {
			}else{
			   $json['error'] = 'Пожалуйста, укажите Ваше настоящее Имя';
			}
			
			$text = '';
			if (!isset($json['error'])) {
				//send form
				$html = '<h3>Письмо от '.$this->request->post['nameTop'].'</h3>';
				if($this->request->post['nameTop'])$html .= '<p><b>Имя:</b> '.$this->request->post['nameTop'].'</p>';
				$html .= '<p><b>Телефон:</b> '.$this->request->post['phone2'].'</p>';
				
				
				$mail = new Mail(); 
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->hostname = $this->config->get('config_smtp_host');
				$mail->username = $this->config->get('config_smtp_username');
				$mail->password = $this->config->get('config_smtp_password');
				$mail->port = $this->config->get('config_smtp_port');
				$mail->timeout = $this->config->get('config_smtp_timeout');			
				$mail->setTo($this->config->get('config_email'));
				$mail->setFrom($this->config->get('config_email'));
			
				$mail->setSender($this->request->post['nameTop']);
				$mail->setSubject(html_entity_decode('Обратный звонок для '.$this->request->post['nameTop'], ENT_QUOTES, 'UTF-8'));
				$mail->setHtml($html);
				$mail->setText(html_entity_decode($text, ENT_QUOTES, 'UTF-8'));
				$mail->send();
				$json['success'] = true;
				

			}

			
		}
		
		$this->response->setOutput(json_encode($json));
	}	

	public function send_form_product() {

		$json = array();
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['nameTel']) < 6) || (utf8_strlen($this->request->post['nameTel']) > 2500)) {
				$json['error'] = 'Заполните пожалуйста номер телефона';
			}
			if ((utf8_strlen($this->request->post['nameProduct']) < 3) || (utf8_strlen($this->request->post['nameProduct']) > 2500)) {
				$json['error'] = 'Пожалуйста, укажите Ваше имя';
			}		
		
			if (preg_match("/^(?:[a-z0-9]+(?:[-_.]?[a-z0-9]+)?@[a-z0-9_.-]+(?:\.?[a-z0-9]+)?\.[a-z]{2,5})$/i", ($this->request->post['nameMail']))) {
			 }else{
				$json['error'] = 'Пожалуйста, укажите Ваше настоящий адрес';
			 }
			 if (preg_match("/^(([a-zA-Z-]{1,30})|([а-яА-ЯЁёІіЇїҐґЄє-]{1,30}))$/u", ($this->request->post['nameProduct']))) {
			}else{
			   $json['error'] = 'Пожалуйста, укажите Ваше настоящее Имя';
			}
			 
			$text = '';
			if (!isset($json['error'])) {
				//send form
				$html = '<h3>Письмо от '.$this->request->post['nameProduct'].'</h3>';
				if($this->request->post['nameProduct'])$html .= '<p><b>Имя:</b> '.$this->request->post['nameProduct'].'</p>';
				$html .= '<p><b>Телефон:</b> '.$this->request->post['nameTel'].'</p>';
				
				$html .= '<p><b>Тип клиента:</b> '.$this->request->post['clientPost'].'</p>';
				
				$html .= '<p><b>Товар:</b> '.$this->request->post['nameTitleProduct'].'</p>';

				
				$html .= '<p><b>Email:</b> '.$this->request->post['nameMail'].'</p>';

				$html .= '<p><b>Комментарий:</b> '.$this->request->post['nameText'].'</p>';
				

				$mail = new Mail(); 
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->hostname = $this->config->get('config_smtp_host');
				$mail->username = $this->config->get('config_smtp_username');
				$mail->password = $this->config->get('config_smtp_password');
				$mail->port = $this->config->get('config_smtp_port');
				$mail->timeout = $this->config->get('config_smtp_timeout');			
				$mail->setTo($this->config->get('config_email'));
				$mail->setFrom($this->config->get('config_email'));
			
				$mail->setSender($this->request->post['nameProduct']);
				$mail->setSubject(html_entity_decode('Заказ на товар', ENT_QUOTES, 'UTF-8'));
				$mail->setHtml($html);
				$mail->setText(html_entity_decode($text, ENT_QUOTES, 'UTF-8'));
				$mail->send();
				$json['success'] = true;
				

			}

			
		}
		
		$this->response->setOutput(json_encode($json));
	}
}
