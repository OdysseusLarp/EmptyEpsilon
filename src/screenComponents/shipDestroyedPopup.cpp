#include "shipDestroyedPopup.h"
#include "playerInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "soundManager.h"
#include "main.h"
#include "gameGlobalInfo.h"

#include "gui/gui2_overlay.h"
#include "gui/gui2_canvas.h"
#include "gui/gui2_label.h"
#include "gui/gui2_button.h"
#include "gui/gui2_panel.h"

GuiShipDestroyedPopup::GuiShipDestroyedPopup(GuiCanvas* owner)
: GuiElement(owner, "SHIP_DESTROYED_POPUP"), owner(owner)
{
    setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

    ship_destroyed_overlay = new GuiOverlay(this, "SHIP_DESTROYED", glm::u8vec4(0, 0, 0, 128));
    (new GuiPanel(ship_destroyed_overlay, "SHIP_DESTROYED_FRAME"))->setPosition(0, 0, sp::Alignment::Center)->setSize(800, 100);
    (new GuiLabel(ship_destroyed_overlay, "SHIP_DESTROYED_TEXT", "EMERGENCY RETRIEVAL ACTIVATED!", 70))->setPosition(0, 0, sp::Alignment::Center)->setSize(800, 100);

    ship_retrieved_overlay = new GuiOverlay(this, "SHIP_RETRIEVED", glm::u8vec4(0, 0, 0, 128));
    (new GuiPanel(ship_retrieved_overlay, "SHIP_RETRIEVED_FRAME"))->setPosition(0, 0, sp::Alignment::Center)->setSize(800, 100);
    (new GuiLabel(ship_retrieved_overlay, "SHIP_RETRIEVED_TEXT", "EMERGENCY DOCKING IN PROGRESS", 70))->setPosition(0, 0, sp::Alignment::Center)->setSize(800, 100);

    ship_callsign = my_spaceship->getCallSign();
    retrievable = my_spaceship->getCanBeDestroyed();

    show_timeout.start(5.0);
}

void GuiShipDestroyedPopup::onDraw(sp::RenderTarget& target)
{
    if (my_spaceship)
    {
        ship_destroyed_overlay->hide();
        ship_retrieved_overlay->hide();
        show_timeout.start(5.0);
        
    } else {
        if (show_timeout.isExpired()) {
            soundManager->stopMusic();
            if (!retrievable) {
                returnToShipSelection(this->owner->getRenderLayer());
                this->owner->destroy();
            } else {
                ship_destroyed_overlay->show();
                docked_timeout.start(25.0);
            }
        }
        if (docked_timeout.isExpired()) {
            ship_destroyed_overlay->hide();
            ship_retrieved_overlay->show();
            return_timeout.start(5.0);
        }
        if (return_timeout.isExpired()) {
            returnToShipSelection(this->owner->getRenderLayer());
            this->owner->destroy();
        }

    }
}
