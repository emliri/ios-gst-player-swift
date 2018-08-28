#import <gst/player/player.h>
#import <AudioPlayer/AudioPlayer-Swift.h>
#import "Gstreamer.h"
#import "GstreamerConfiguration.h"

@interface Gstreamer () <ProviderProtocol> @end

@implementation Gstreamer

static GstPlayer *monoPlayer;
static id<ProviderDelegate> monoDelegate;

-(instancetype)init {
    self = [super init];
    if (!monoPlayer) {
        [self configurePlayer];
    }
    return self;
}

-(void)setDelegate:(id<ProviderDelegate>)delegate {
    monoDelegate = delegate;
}

-(id<ProviderDelegate>)delegate {
    return monoDelegate;
}

-(void)play {
    gst_player_play(monoPlayer);
}

-(void)pause {
    gst_player_pause(monoPlayer);
}

-(void)setSourceWithUrl:(NSString * _Nonnull)url {
    gst_player_set_uri(monoPlayer, [url cStringUsingEncoding:NSASCIIStringEncoding]);
}

-(void)stop {
    gst_player_stop(monoPlayer);
}

-(void)seekWithSeconds:(long)seconds {
    gst_player_seek(monoPlayer, seconds);
}

-(void)configurePlayer {
    GstreamerConfiguration();
    gst_debug_set_threshold_for_name(kGstPlayer, GST_LEVEL_ERROR);
    gst_debug_set_threshold_from_string("play*:9,decodebin:9,filescrc:9", YES);
    monoPlayer = gst_player_new(NULL, NULL);
    [self configureCallBacks];
}

-(void)configureCallBacks {
    g_signal_connect(monoPlayer, kPositionUpdated, G_CALLBACK(positionCallback), NULL);
    g_signal_connect(monoPlayer, kDurationChanged, G_CALLBACK(durationCallback), NULL);
    g_signal_connect(monoPlayer, kEndOfStream, G_CALLBACK(endOfStreamCallback), NULL);
    g_signal_connect(monoPlayer, kInfoUpdated, G_CALLBACK(infoUpdatedCallback), NULL);
    g_signal_connect(monoPlayer, kStateChanged, G_CALLBACK(stateChangedCallback), NULL);
    g_signal_connect(monoPlayer, kError, G_CALLBACK(errorCallback), NULL);
}

void positionCallback(void *player, long time, void *data) {
    [monoDelegate positionCallbackWithTime:time];
}

void durationCallback(void *player, long time, void *data) {
    [monoDelegate durationCallbackWithTime:time];
}

void endOfStreamCallback(void *player, void *data) {
    [monoDelegate endOfStream];
}

void infoUpdatedCallback(void *player, GstPlayerMediaInfo *info, void *data) {
    [monoDelegate playingUpdatedWithUrl:[[NSString alloc] initWithUTF8String:gst_player_media_info_get_uri(info)]];
}

void stateChangedCallback(void *player, GstPlayerState state, void *data) {
    
}

void errorCallback(void *player, GError *error, void *data) {
    [monoDelegate foundErrorWithMessage:[[NSString alloc] initWithUTF8String:error->message] code:(long)(error->code)];
}

static char *const kGstPlayer = "gst-player";
static char *const kPositionUpdated = "position-updated";
static char *const kDurationChanged = "duration-changed";
static char *const kEndOfStream = "end-of-stream";
static char *const kInfoUpdated = "media-info-updated";
static char *const kStateChanged = "state-changed";
static char *const kError = "error";

@end
