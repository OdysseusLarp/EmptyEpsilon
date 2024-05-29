#ifndef SHIP_DESTROYED_POPUP_H
#define SHIP_DESTROYED_POPUP_H

#include "gui/gui2_element.h"
#include "timer.h"


class GuiPanel;
class GuiCanvas;
class GuiOverlay;

class GuiShipDestroyedPopup : public GuiElement
{
private:
    GuiOverlay* ship_destroyed_overlay;
    GuiOverlay* ship_retrieved_overlay;
    GuiCanvas* owner;
    sp::SystemTimer show_timeout;
    sp::SystemTimer docked_timeout;
    sp::SystemTimer return_timeout;
    bool retrievable;
    string ship_callsign; 

public:
    GuiShipDestroyedPopup(GuiCanvas* owner);

    virtual void onDraw(sp::RenderTarget& target) override;
};

#endif//SHIP_DESTROYED_POPUP_H