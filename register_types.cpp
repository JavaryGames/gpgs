#include <core/version_generated.gen.h>

#if VERSION_MAJOR == 3
#include <core/class_db.h>
#include <core/engine.h>
#else
#include "core/class_db.h"
#include "core/globals.h"
#endif

#include "register_types.h"
#include "ios/GodotPlayGameServices.h"

void register_gpgs_types() {
#if VERSION_MAJOR == 3
    Engine::get_singleton()->add_singleton(Engine::Singleton("GodotPlayGameServices", memnew(GodotPlayGameServices)));
#else
    Globals::get_singleton()->add_singleton(Globals::Singleton("GodotPlayGameServices", memnew(GodotPlayGameServices)));
#endif
}

void unregister_gpgs_types() {
}
