//
//  PlaylistsManager.swift
//  Playlists
//
//  Created by Corbin Montague on 7/12/24.
//

import Combine
import Foundation

final public class PlaylistsManager: PlaylistsManaging, ObservableObject {
    public static let shared = PlaylistsManager()
    
    private init(playlists: [Playlist] = []) {
        self.playlists = playlists
    }
    
    // MARK: - PlaylistsManaging
    
    @Published public var playlists: [Playlist] {
        didSet {
            print("Playlists.didSet: \(playlists)")
        }
    }
    public var playlistsPublisher: AnyPublisher<[Playlist], Never> {
        $playlists
            .share()
            .eraseToAnyPublisher()
    }
    
    @discardableResult public func loadPlaylists() -> [Playlist] {
        print("Loading Playlists...")
        if let data = UserDefaults.standard.object(forKey: UserDefaultsKeys.playlists.rawValue) as? Data {
            if let playlistsDecoded = try? JSONDecoder().decode(Array.self, from: data) as [Playlist] {
                playlists = playlistsDecoded
            }
        }
        return playlists
    }
    
    public func addPlaylist(playlist: Playlist) {
        print("Add Playlist: \(playlist.id)")
        playlists.append(playlist)
        savePlaylistsToDisk()
    }
    
    @discardableResult public func deletePlaylist(playlistId: String) -> Bool {
        for i in 0..<self.playlists.count {
            let playlist = self.playlists[i]
            if playlist.id == playlistId {
                print("Deleting Playlist: \(playlistId)")
                self.playlists.remove(at: i)
                self.savePlaylistsToDisk()
                return true
            }
        }
        print("Failed to Delete Playlist: \(playlistId)")
        return false
    }
    
    @discardableResult public func deleteSongFromPlaylist(songId: String, playlistId: String) -> Bool {
        for playlistIndex in 0..<self.playlists.count {
            let playlist = self.playlists[playlistIndex]
            if playlist.id == playlistId {
                for songIndex in 0..<playlist.songs.count {
                    let song = playlist.songs[songIndex]
                    if song.id == songId {
                        print("Deleting Song \(songId) from Playlist: \(playlistId)")
                        self.playlists[playlistIndex].songs.remove(at: songIndex)
                        self.savePlaylistsToDisk()
                        return true
                    }
                }
            }
        }
        print("Failed to Delete Song \(songId) from Playlist: \(playlistId)")
        return false
    }
    
    // MARK: - Helpers
    
    private func savePlaylistsToDisk() {
        if let encoded = try? JSONEncoder().encode(self.playlists) {
            UserDefaults.standard.set(encoded, forKey: UserDefaultsKeys.playlists.rawValue)
            print("Saved Playlists To Disk")
        }
    }
}
