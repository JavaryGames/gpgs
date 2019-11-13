#ifndef GODOT_PLAYGAMESERVICES_H
#define GODOT_PLAYGAMESERVICES_H

#include <core/version_generated.gen.h>

#include "core/reference.h"

class GodotPlayGameServices : public Reference {
    
#if VERSION_MAJOR == 3
    GDCLASS(GodotPlayGameServices, Reference);
#else
    OBJ_TYPE(GodotPlayGameServices, Reference);
#endif

 int callbackID

protected:
    static void _bind_methods();

public:
  /*  
    void ask_and_rate(const String &message, const String &positive_button_text, const String &negative_button_text, const String &app_id);
    
    void rate(const String &url_prefix, const String &url_prefix_fallback, const String &id_format, const String &app_id);
  */
    void GodotPlayGameServices::startConnectionCallback();
    void GodotPlayGameServices::setConnectionCallbackId(int objId);
    void GodotPlayGameServices::isOnline(); 

    GodotPlayGameServices();
    ~GodotPlayGameServices();
    
};

#endif
