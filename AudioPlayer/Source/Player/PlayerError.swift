import Foundation

struct PlayerError:LocalizedError {
    let errorDescription:String?
    
    static let sourceNotSet:PlayerError = PlayerError(errorDescription:NSLocalizedString(
        "PlayerError_sourceNotSet", tableName:nil, bundle:Bundle(for:Player.self), comment:String()))
    static let canNotPause:PlayerError = PlayerError(errorDescription:NSLocalizedString(
        "PlayerError_canNotPause", tableName:nil, bundle:Bundle(for:Player.self), comment:String()))
    static let canNotStop:PlayerError = PlayerError(errorDescription:NSLocalizedString(
        "PlayerError_canNotStop", tableName:nil, bundle:Bundle(for:Player.self), comment:String()))
    static let canNotSeek:PlayerError = PlayerError(errorDescription:NSLocalizedString(
        "PlayerError_canNotSeek", tableName:nil, bundle:Bundle(for:Player.self), comment:String()))
    static let alreadyPlaying:PlayerError = PlayerError(errorDescription:NSLocalizedString(
        "PlayerError_alreadyPlaying", tableName:nil, bundle:Bundle(for:Player.self), comment:String()))
    static let noList:PlayerError = PlayerError(errorDescription:NSLocalizedString(
        "PlayerError_noList", tableName:nil, bundle:Bundle(for:Player.self), comment:String()))
    static let noPrevious:PlayerError = PlayerError(errorDescription:NSLocalizedString(
        "PlayerError_noPrevious", tableName:nil, bundle:Bundle(for:Player.self), comment:String()))
    static let noNext:PlayerError = PlayerError(errorDescription:NSLocalizedString(
        "PlayerError_noNext", tableName:nil, bundle:Bundle(for:Player.self), comment:String()))
}
