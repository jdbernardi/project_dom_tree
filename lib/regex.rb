		#OPEN_TAG_REGEX = /<(\s*\w*\s*).*?>/


		OPEN_TAG_REGEX = /^<([^\/|\s]\s*\w*\s*).*?>/  #causes stack error

		OPEN_TAG_CONTENT = /^<(.*?)>/

		CLOSING_TAG_REGEX = /^<(\/)/

		CLASS_REGEX = /class[ = ]*[",'](.*?)[",']/

		ID_REGEX = /id[ = ]*[",'](.*?)[",']/

		NAME_REGEX = /name[ = ]*[",'](.*?)[",']/

		ENTIRE_OPEN_TAG = /^<.*?>/

		SPECIAL_TAG = /^<(em|span)/

		TEXT = /^(.*?)</