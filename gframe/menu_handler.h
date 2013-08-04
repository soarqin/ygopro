#ifndef MENU_HANDLER_H
#define MENU_HANDLER_H

#include "config.h"

namespace ygo {

class MenuHandler: public irr::IEventReceiver {
public:
	virtual bool OnEvent(const irr::SEvent& event);

	void OnJoinHost();
	
};

}

#endif //MENU_HANDLER_H
