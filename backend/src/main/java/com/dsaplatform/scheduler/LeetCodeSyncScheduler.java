package com.dsaplatform.scheduler;

import com.dsaplatform.model.User;
import com.dsaplatform.repository.UserRepository;
import com.dsaplatform.service.AuthService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
@Slf4j
public class LeetCodeSyncScheduler {

    private final UserRepository userRepository;
    private final AuthService authService;

    // Run every hour
    @Scheduled(cron = "0 0 * * * *")
    public void syncAllUsers() {
        log.info("Starting scheduled LeetCode progress sync for all users");
        List<User> usersToSync = userRepository.findByLeetcodeUsernameIsNotNull();

        for (User user : usersToSync) {
            log.debug("Syncing progress for user: {}", user.getEmail());
            authService.syncLeetCodeStats(user);
        }

        log.info("Finished scheduled LeetCode progress sync. Synced {} users.", usersToSync.size());
    }
}
