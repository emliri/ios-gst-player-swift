#ifndef GStreamerInterface_h
#define GStreamerInterface_h

void GstPlayerInit();
void* GstPlayerCreate(void positionCallback(void *player, long arg1, void *data), void* userData);
void GstPlayerSetUri(void* player, const char *uri);
void GstPlayerPlay(void* player);
void GstPlayerSeek(void* player, int milliseconds);

#endif
