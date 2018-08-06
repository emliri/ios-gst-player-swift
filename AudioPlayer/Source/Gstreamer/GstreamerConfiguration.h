#ifndef __GstreamerConfiguration_H__
#define __GstreamerConfiguration_H__

#include <gst/gst.h>

G_BEGIN_DECLS

#define GST_G_IO_MODULE_DECLARE(name) \
extern void G_PASTE(g_io_module_, G_PASTE(name, _load_static)) (void)

#define GST_G_IO_MODULE_LOAD(name) \
G_PASTE(g_io_module_, G_PASTE(name, _load_static)) ()

#define GST_IOS_PLUGINS_CORE
#define GST_IOS_PLUGINS_SYS
#define GST_IOS_PLUGINS_PLAYBACK
#define GST_IOS_PLUGINS_CODECS
#define GST_IOS_PLUGINS_NET
#define GST_IOS_GIO_MODULE_GNUTLS

void GstreamerConfiguration (void);

G_END_DECLS

#endif
