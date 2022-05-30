<?php

use Nette;
use Nette\Security\Passwords;

abstract class MyBasePresenter extends Nette\Application\UI\Presenter {
}

class ProfilePresenter extends MyBasePresenter {
	public function profileFormSucceeded(Form $form) {
		$this->user->password = Passwords::hash($form->getValues()->password);
	}
}
